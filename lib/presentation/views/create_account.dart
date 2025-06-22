import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scan_canser_detection/controllers/auth/auth_cubit.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/localization/language/language_cubit.dart';
import 'package:scan_canser_detection/core/utils/router/app_router.dart';
import 'package:scan_canser_detection/core/widgets/custom_bottom.dart';
import 'package:scan_canser_detection/core/widgets/custom_text_filed.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false; // variable for password visibility
  TextEditingController? nameController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? verifyPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LanguageCubit>().state;
    final isArabic = locale.languageCode == 'ar';

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CreateSuccess) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(isArabic
                    ? "التحقق من البريد الإلكتروني"
                    : "Email Verification"),
                content: Text(isArabic
                    ? "تم إرسال رسالة تحقق إلى بريدك الإلكتروني. يرجى التحقق من صندوق الوارد والتحقق من بريدك الإلكتروني قبل تسجيل الدخول."
                    : "A verification email has been sent to your email address. Please check your inbox and verify your email before logging in."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      GoRouter.of(context).pushReplacement(
                          AppRouter.kLoginView); // Navigate to the login page
                    },
                    child: Text(isArabic ? "موافق" : "OK"),
                  ),
                ],
              );
            },
          );
        } else if (state is CreateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
            body: ModalProgressHUD(
              inAsyncCall: state is CreateLoading,
              progressIndicator: Lottie.asset(AppAssets.loding, height: 150),
              child: Padding(
                padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: isArabic
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(isArabic ? "إنشاء حساب" : "Sign Up",
                            style: const TextStyle(
                                fontSize: 24,
                                fontFamily: 'Bahnschrift',
                                color: Color(0xff00487C),
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        controller: nameController,
                        label: isArabic ? "الاسم" : "Name",
                        hintText: isArabic ? "أدخل اسمك" : "Enter your name",
                        icon: Icons.person_2_outlined,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        controller: emailController,
                        label: isArabic ? "البريد الإلكتروني" : "Email",
                        hintText: isArabic
                            ? "أدخل بريدك الإلكتروني"
                            : "Enter your email",
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return isArabic
                                ? "يرجى إدخال كلمة المرور الخاصة بك"
                                : "please enter your password";
                          } else if (p0.length < 8) {
                            return isArabic
                                ? "يجب أن تكون كلمة المرور 8 أحرف على الأقل"
                                : "Password must be at least 8 characters";
                          }
                          return null;
                        },
                        controller: passwordController,
                        label: isArabic ? "كلمة المرور" : "Password",
                        hintText: isArabic
                            ? "أدخل كلمة المرور الخاصة بك"
                            : "Enter your password",
                        isVisible: true,
                        icon: Icons.lock_outlined,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomBottom(
                          text: isArabic ? "إنشاء حساب" : "Create Account",
                          ontap: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthCubit>().createAccount(
                                    email: emailController!.text,
                                    password: passwordController!.text,
                                    userName: nameController!.text,
                                  );
                            }
                          }),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isArabic
                                ? "هل لديك حساب بالفعل؟"
                                : "Already have an account ?",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Bahnschrift'),
                          ),
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context)
                                  .pushReplacement(AppRouter.kLoginView);
                            },
                            child: Text(
                              isArabic ? "تسجيل الدخول" : "login",
                              style: const TextStyle(
                                  color: Color(0xff00487C),
                                  fontSize: 14,
                                  fontFamily: 'Bahnschrift'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
