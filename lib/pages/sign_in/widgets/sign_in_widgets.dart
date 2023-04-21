import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skillsphere/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        // height defines the thickness of the line
        height: 2,
      ),
    ),
    title: Center(
      child: Text(
        "Log In",
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

// we need context for accessing bloc

Widget buildThirdpartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: 36.h,
      bottom: 20.h,
    ),
    padding: EdgeInsets.only(
      left: 25.w,
      right: 25.h,
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      _reusableIcons("google"),
      _reusableIcons("apple"),
      _reusableIcons("facebook"),
    ]),
  );
}

GestureDetector _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 40.w,
      width: 40.w,
      child: Image.asset(
        "assets/icons/$iconName.png",
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.5),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buildtextField(String hintText, String textType, String iconName) {
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    height: 50.h,
    width: 325.w,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15.w),
        ),
        border: Border.all(
          color: AppColors.primaryFourElementText,
        )),
    child: Row(children: [
      Container(
        margin: EdgeInsets.only(
          left: 17.w,
        ),
        height: 16.w,
        width: 16.w,
        child: Image.asset("assets/icons/$iconName.png"),
      ),
      Container(
        width: 270.w,
        height: 50.h,
        child: TextField(
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintStyle: const TextStyle(
                  color: AppColors.primarySecondaryElementText)),
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.normal,
            fontSize: 14.sp,
          ),
          autocorrect: false,
          obscureText: textType == "password" ? true : false,
        ),
      ),
    ]),
  );
}

Widget forgotPassword() {
  return Container(
    height: 44.h,
    width: 260.w,
    child: GestureDetector(
      onTap: () {},
      child: const Text(
        "Forgot Password",
        style: TextStyle(
            color: AppColors.primaryText,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryElement),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(String buttonName, String buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(
        top: buttonType == "login" ? 40.h : 20.h,
      ),
      height: 50.h,
      width: 325.h,
      decoration: BoxDecoration(
          color: buttonType == "login"
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
            color: buttonType == "login"
                ? Colors.transparent
                : AppColors.primaryFourElementText,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 2,
              offset: Offset(0, 1),
              color: Colors.grey.withOpacity(0.1),
            )
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttonType == "login"
                ? AppColors.primaryBackground
                : AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}
