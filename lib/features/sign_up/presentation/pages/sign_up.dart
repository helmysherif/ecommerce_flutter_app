import 'package:ecommerce_app/config/routes/routes.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:ecommerce_app/core/utils/components.dart';
import 'package:ecommerce_app/features/sign_up/data/data_sources/remote_data_source.dart';
import 'package:ecommerce_app/features/sign_up/presentation/manager/cubit.dart';
import 'package:ecommerce_app/features/sign_up/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(RemoteDataSource()),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, states) {
          if (states is SignUpLoadingState) {
            showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                      backgroundColor: Colors.transparent,
                      title: Center(
                          child: CircularProgressIndicator(
                              color: AppColors.primary)),
                    ));
          } else if (states is SignUpErrorState) {
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Error"),
                      content: Text(states.failures.message ?? ""),
                    ));
          } else if (states is SignUpSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.login, (route) => false);
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
                      defaultFormField(
                          controller: SignUpCubit.get(context).nameController,
                          label: "Full Name",
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter a valid full name";
                            }
                          }),
                      SizedBox(height: 32.h),
                      defaultFormField(
                          controller: SignUpCubit.get(context).phoneController,
                          label: "Phone Number",
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter a valid phone number";
                            }
                          }),
                      SizedBox(height: 32.h),
                      defaultFormField(
                          controller: SignUpCubit.get(context).emailController,
                          label: "Email",
                          validate: (value) {
                            bool emailValid = RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value);
                            if (value == null || value.isEmpty || !emailValid) {
                              return "please enter a valid email address";
                            }
                            return null;
                          }),
                      SizedBox(height: 32.h),
                      defaultFormField(
                          controller:
                              SignUpCubit.get(context).passwordController,
                          label: "Password",
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter a valid password";
                            }
                          },
                          isPassword: true),
                      SizedBox(height: 56.h),
                      SizedBox(
                        height: 64.h,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              SignUpCubit.get(context).signUp();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: Text(
                            "Create Account",
                            style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary),
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "I Have an account?",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.login);
                            },
                            child: Text(
                              "login",
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
      ),
    );
  }
}
