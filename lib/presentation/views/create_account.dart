import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scan_canser_detection/controllers/auth/auth_cubit.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CreateSuccess) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Email Verification"),
                content: const Text(
                    "A verification email has been sent to your email address. Please check your inbox and verify your email before logging in."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      GoRouter.of(context).pushReplacement(
                          AppRouter.kLoginView); // Navigate to the login page
                    },
                    child: const Text("OK"),
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
                    children: [
                      const Center(
                        child: Text("Sign Up",
                            style: TextStyle(
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
                        label: "Name",
                        hintText: "Enter your name",
                        icon: Icons.person_2_outlined,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        controller: emailController,
                        label: "Email",
                        hintText: "Enter your email",
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "please enter your password";
                          } else if (p0.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                        controller: passwordController,
                        label: "Password",
                        hintText: "Enter your password",
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
                          text: "Create Account",
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
                          const Text(
                            "Alreadyhave an account ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Bahnschrift'),
                          ),
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context)
                                  .pushReplacement(AppRouter.kLoginView);
                            },
                            child: const Text(
                              "login",
                              style: TextStyle(
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
