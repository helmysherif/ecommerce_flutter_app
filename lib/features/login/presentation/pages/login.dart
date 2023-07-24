import 'package:ecommerce_app/core/utils/app_strings.dart';
import 'package:ecommerce_app/core/utils/text_styles.dart';
import 'package:ecommerce_app/features/login/presentation/manager/cubit.dart';
import 'package:ecommerce_app/features/login/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/components.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, states) {
        if (states is LoginLoadingState) {
          showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                    backgroundColor: Colors.transparent,
                    title: Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primary)),
                  ));
        } else if (states is LoginErrorState) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text("Error"),
                    content: Text(states.failures.message ?? ""),
                  ));
        } else if (states is LoginSuccessState) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.home, (route) => false,
              arguments: states.loginEntity);
        }
      },
      builder: (context, states) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 130.h),
                    Image.asset(AppImages.logo, width: 237.w, height: 71.h),
                    SizedBox(height: 90.h),
                    Text(
                      AppStrings.welcome,
                      style: GoogleFonts.poppins(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      AppStrings.loginHint,
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    SizedBox(height: 40.h),
                    defaultFormField(
                        controller: LoginCubit.get(context).emailController,
                        label: "Email",
                        validate: (value) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (value == null || value.isEmpty || !emailValid) {
                            return "please enter a valid email address";
                          }
                          return null;
                        }),
                    SizedBox(height: 32.h),
                    defaultFormField(
                        controller: LoginCubit.get(context).passwordController,
                        label: "Password",
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter a valid password";
                          }
                        },
                        isPassword: true),
                    SizedBox(height: 15.h),
                    Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(height: 56.h),
                    SizedBox(
                      height: 64.h,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).login();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: Text("Login", style: poppins20W600()),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an account?",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signUp);
                          },
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
