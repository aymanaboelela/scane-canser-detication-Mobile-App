import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scan_canser_detection/core/constants/app_cach_data.dart';
import 'package:scan_canser_detection/core/helper/cach_data.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final supabase = Supabase.instance.client;
  Future<void> createAccount({
    required String email,
    required String password,
    required String userName,
  }) async {
    emit(CreateLoading());

    try {
      final AuthResponse response = await supabase.auth.signUp(
        emailRedirectTo:
            "https://createdone33.blogspot.com/2025/04/blog-post.html?m=0",
        data: {
          "username": userName,
        },
        email: email,
        password: password,
      );

      if (response.user != null) {
        CacheData.setData(key: AppCacheData.userName, value: userName);
        emit(CreateSuccess());
      } else {
        emit(CreateError(message: "Unknown error occurred during signup"));
      }
    } on AuthException catch (e) {
      log("create account the error is **** ${e.message}");

      if (e.message.contains("User already registered")) {
        emit(CreateError(message: "This email is already registered"));
      } else if (e.message.contains("password")) {
        emit(CreateError(
            message: "Weak password, please choose a stronger one"));
      } else if (e.message.contains("Invalid email")) {
        emit(CreateError(message: "Invalid email format"));
      } else if (e.message.contains("phone number")) {
        emit(CreateError(message: "This phone number is already in use"));
      } else {
        emit(CreateError(message: e.message));
      }
    } catch (e) {
      log("create account the error is **** $e");
      emit(CreateError(message: "An unexpected error occurred"));
    }
  }

  Future<void> resendVerificationEmail(String email) async {}

  // Future<void> verifyOtp({
  //   String? email,
  //   String? phone,
  //   required String token,
  //   required OtpType type,
  // }) async {
  //   emit(OTPVerificationLoading());
  //   try {
  //     await supabase.auth.verifyOTP(
  //       email: email,
  //       phone: phone,
  //       token: token,
  //       type: type,
  //     );
  //     emit(LoginSuccess()); // Assuming successful verification logs user in
  //   } on AuthException catch (e) {
  //     emit(OTPVerificationError(message: e.message));
  //   } catch (e) {
  //     emit(OTPVerificationError(message: e.toString()));
  //   }
  // }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final AuthResponse response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.session != null) {
        emit(LoginSuccess());
      } else {
        emit(LoginError(message: "Login failed. Please try again."));
      }
      CacheData.setData(
          key: AppCacheData.userName,
          value: response.user?.userMetadata?['username']);
      CacheData.setData(key: AppCacheData.email, value: response.user?.email);
    } on AuthException catch (e) {
      log("login the error is **** ${e.message}");

      if (e.message.contains("Invalid login credentials")) {
        emit(LoginError(
            message: "Incorrect email or password. Please try again."));
      } else if (e.message.contains("Email not confirmed")) {
        emit(LoginError(
            message: "Your email is not confirmed. Please check your inbox."));
      } else if (e.message.contains("User not found")) {
        emit(LoginError(message: "No account found with this email."));
      } else if (e.message.contains("Too many requests")) {
        emit(LoginError(
            message: "Too many failed attempts. Please wait and try again."));
      } else if (e.message.contains("Auth session missing")) {
        emit(LoginError(
            message:
                "Authentication session is missing. Please log in again."));
      } else {
        emit(LoginError(message: e.message));
      }
    } catch (e) {
      log("login the error is **** $e");
      emit(LoginError(message: "An unexpected error occurred."));
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    try {
      await supabase.auth.resetPasswordForEmail(email,
          captchaToken: "5000", redirectTo: "50000");
      emit(ResetPasswordSuccess());
    } on Exception catch (e) {
      emit(ResetPasswordError(message: e.toString()));
    } catch (e) {
      emit(ResetPasswordError(message: e.toString()));
    }
  }

  // Future<void> checkAuth() async {
  //   final user = supabase.auth.currentUser;
  //   if (user != null) {
  //     emit(LoginSuccess());
  //   } else {
  //     emit(AuthInitial());
  //   }
  // }
  Future<void> resetPasswordWithOTP({
    required String email,
    required String resetToken,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoading());

    try {
      // Verify the OTP (token) to confirm the reset process
      final recovery = await supabase.auth.verifyOTP(
        email: email,
        token: resetToken,
        type: OtpType.recovery, // Type: recovery
      );

      print("OTP verification result: $recovery");

      // Update the password for the user
      await supabase.auth.updateUser(
        UserAttributes(password: newPassword),
      );

      emit(ResetPasswordSuccess());
    } on AuthException catch (e) {
      emit(ResetPasswordError(message: e.message));
    } catch (e) {
      emit(ResetPasswordError(message: e.toString()));
    }
  }

  Future<void> saveOTP(String otp) async {
    await CacheData.setData(key: AppCacheData.otpKey, value: otp);
    await CacheData.setData(
        key: AppCacheData.otpCreatedAtKey,
        value: DateTime.now().millisecondsSinceEpoch);
  }
}
