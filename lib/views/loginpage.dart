import 'package:e_commerce_clothes/route/approute.dart';
import 'package:e_commerce_clothes/route/const_route.dart';
import 'package:e_commerce_clothes/utils/snackbar.dart';
import 'package:e_commerce_clothes/utils/style.dart';
import 'package:e_commerce_clothes/widget/custom_text_form_field.dart';
import 'package:e_commerce_clothes/widget/custombutton.dart';
import 'package:e_commerce_clothes/widget/mediumtitle.dart';
import 'package:e_commerce_clothes/widget/subtitle_widget.dart';
import 'package:e_commerce_clothes/widget/title_widet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  GlobalKey<FormState> formState = GlobalKey();
  bool obscuretext = true;
  bool isLoading = false;
  TextEditingController emailControlle = TextEditingController();
  TextEditingController passWordControlle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: Form(
            key: formState,
            child: Padding(
              padding: EdgeInsets.all(24.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidet(title: "Login to your account"),
                    SizedBox(height: 8.h),
                    SubtitleWidget(subtitle: "It’s great to see you again."),
                    SizedBox(height: 24.h),
                    Mediumtitle(mediumTitle: "User Name"),
                    SizedBox(height: 4.h),
                    CustomTextFormField(
                      hint: "Enter your email address",
                      textEditingController: emailControlle,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This is Field is Requried";
                        } else if (!value.endsWith("@gmail.com")) {
                          return "Field Must be End With @gmail.com";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    Mediumtitle(mediumTitle: "PassWord"),
                    SizedBox(height: 4.h),
                    CustomTextFormField(
                      textEditingController: passWordControlle,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This is Field is Required";
                        } else if (value.length < 8) {
                          return "PassWord Must be greater than 8";
                        }
                        return null;
                      },
                      obscuretext: obscuretext,
                      hint: "Enter your PassWord",
                      icon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscuretext = !obscuretext;
                          });
                        },
                        icon: obscuretext
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                    SizedBox(height: 70.h),
                    Custombutton(
                      buttonName: "Sign in",
                      onPressed: () async {
                        if (formState.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                             await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                  email: emailControlle.text,
                                  password: passWordControlle.text,
                                );
                            showSnackBar(
                              context,
                              snack: "Successful",
                              color: Colors.greenAccent,
                            );
                            emailControlle.clear();
                            passWordControlle.clear();
                            GoRouter.of(
                              context,
                            ).pushReplacementNamed(RouteName.homeName);
                          } on FirebaseAuthException catch (e) {
                            if (!mounted) return;

                            if (e.code == 'user-not-found') {
                              showSnackBar(
                                context,
                                snack: 'No user found for that email.',
                                color: Colors.red,
                              );
                            } else if (e.code == 'wrong-password') {
                              showSnackBar(
                                context,
                                snack: 'Wrong password provided for that user.',
                                color: Colors.red,
                              );
                            } else if (e.code == 'invalid-credential') {
                              showSnackBar(
                                context,
                                snack: 'Email or password is incorrect',
                                color: Colors.red,
                              );
                            } else {
                              showSnackBar(
                                context,
                                snack: e.message ?? "Login failed",
                                color: Colors.red,
                              );
                            }
                          }
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    ),
                    SizedBox(height: 280.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: AppStyle.subtitle,
                        ),
                        GestureDetector(
                          onTap: () {
                            goRouter.goNamed(RouteName.registerName);
                          },
                          child: Mediumtitle(mediumTitle: "Register"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
