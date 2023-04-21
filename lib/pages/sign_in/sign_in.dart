import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skillsphere/pages/sign_in/widgets/sign_in_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static const routeName = "signIn";
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              buildThirdpartyLogin(context),
              // since we have set our crossAxis Alignment, we need to use center widget here
              Center(child: reusableText("Or use your email account login")),
              // to apply margin we are using container
              Container(
                margin: EdgeInsets.only(
                  top: 66.h,
                ),
                padding: EdgeInsets.only(
                  left: 25.w,
                  right: 25.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText("Email"),
                    buildtextField("Enter your email address", "email", "user"),
                    reusableText("Password"),
                    buildtextField("Enter your password ", "password", "lock"),
                    forgotPassword(),
                    buildLoginAndRegButton("Login", "login"),
                    buildLoginAndRegButton("Register", "register"),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
