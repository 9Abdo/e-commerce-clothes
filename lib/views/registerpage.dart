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

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  GlobalKey<FormState> formState = GlobalKey();
  bool obscuretext1 = true;
  bool obscuretext2 = true;
  bool isLoading = false;
  TextEditingController fullNameControlle = TextEditingController();
  TextEditingController emailControlle = TextEditingController();
  TextEditingController passwordControlle = TextEditingController();
  TextEditingController confirmPasswordControlle = TextEditingController();
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
                    TitleWidet(title: "Create an account"),
                    SizedBox(height: 8.h),
                    SubtitleWidget(subtitle: "Let’s create your account."),
                    SizedBox(height: 24.h),
                    Mediumtitle(mediumTitle: "Full Name"),
                    SizedBox(height: 4.h),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This is Field is Required";
                        }
                        return null;
                      },
                      hint: "Enter your full name",
                      textEditingController: fullNameControlle,
                    ),
                    SizedBox(height: 16.h),
                    Mediumtitle(mediumTitle: "User Name"),
                    SizedBox(height: 4.h),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This is Field is Required";
                        } else if (!value.endsWith("@gmail.com")) {
                          return "Field Must be End With @gmail.com";
                        }
                        return null;
                      },
                      hint: "Enter your email address",
                      textEditingController: emailControlle,
                    ),
                    SizedBox(height: 16.h),
                    Mediumtitle(mediumTitle: "PassWord"),
                    SizedBox(height: 4.h),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This is Field is Requried";
                        } else if (value.length < 8) {
                          return "PassWord Must be greater than 8";
                        }
                        return null;
                      },
                      obscuretext: obscuretext1,
                      hint: "Enter your PassWord",
                      textEditingController: passwordControlle,
                      icon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscuretext1 = !obscuretext1;
                          });
                        },
                        icon: obscuretext1
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Mediumtitle(mediumTitle: "Confirm PassWord"),
                    SizedBox(height: 4.h),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This is Field is Required";
                        } else if (value.length < 8) {
                          return "PassWord Must be greater than 8";
                        } else if (value != passwordControlle.text) {
                          return "Confirm PassWord Must be Matchin PassWord";
                        }
                        return null;
                      },
                      obscuretext: obscuretext2,
                      textEditingController: confirmPasswordControlle,
                      hint: "Enter your PassWord",
                      icon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscuretext2 = !obscuretext2;
                          });
                        },
                        icon: obscuretext2
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                    SizedBox(height: 70.h),
                    Custombutton(
                      buttonName: "Register",
                      onPressed: () async {
                        if (formState.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                  email: emailControlle.text,
                                  password: passwordControlle.text,
                                );
                            await credential.user!.updateDisplayName(
                              fullNameControlle.text,
                            );
                            showSnackBar(
                              context,
                              snack: "Registertion Successfull",
                              color: Colors.greenAccent,
                            );
                            fullNameControlle.clear();
                            emailControlle.clear();
                            passwordControlle.clear();
                            confirmPasswordControlle.clear();
                            GoRouter.of(
                              context,
                            ).pushReplacementNamed(RouteName.homeName);
                          } on FirebaseAuthException catch (e) {
                            if (!mounted) return;
                            if (e.code == 'weak-password') {
                              showSnackBar(
                                context,
                                snack: "Password is too weak",
                                color: Colors.redAccent,
                              );
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar(
                                context,
                                snack: "Email already exists",
                                color: Colors.red,
                              );
                            }
                          } catch (e) {
                            showSnackBar(
                              context,
                              snack: "Something went wrong",
                              color: Colors.red,
                            );
                          }
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    ),
                    SizedBox(height: 60.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: AppStyle.subtitle,
                        ),
                        GestureDetector(
                          onTap: () {
                            goRouter.goNamed(RouteName.loginName);
                          },
                          child: Mediumtitle(mediumTitle: "login"),
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
