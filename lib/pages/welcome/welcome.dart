// since we will be doing navigation later, we will need stateful widget
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skillsphere/common/values/colors.dart';
import 'package:skillsphere/pages/sign_in/sign_in.dart';
import 'package:skillsphere/pages/welcome/bloc/welcome_events.dart';

import 'bloc/welcome_blocs.dart';
import 'bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  // since we need to do animation, we need pagecontroller
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    // container because we can define a bg color...beyond scaffold...complete screen
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              // not fixed at 375...it will adjust as per the screen...making it responsive
              width: 375.w,
              // we will have the whole page and on top of it we'll have dots down there for navigation...it will be there permanently thorughout the navigation
              // moreover using stack widget, you have better control over the position of widgets
              child: Stack(
                // since we wanna scroll, go left and right, we gonna use pageview
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      state.page = value;
                      // we need to update our ui as well
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        context,
                        1,
                        "next",
                        "First See Learning",
                        "Forget about paper learning, all in one knowledge",
                        "assets/images/reading.png",
                      ),
                      _page(
                        context,
                        2,
                        "next",
                        "Connect With Everyone",
                        "Always keep in touch with your tutor & friends. Let's get connected!",
                        "assets/images/boy.png",
                      ),
                      _page(
                        context,
                        3,
                        "Get Started",
                        "Always Fascinated Learning",
                        "Anywhere, anytime. The time is at your discretion so study whenever you want.",
                        "assets/images/man.png",
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 85.h,
                      child: DotsIndicator(
                        position: state.page.toDouble(),
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                          color: AppColors.primaryThreeElementText,
                          activeColor: AppColors.primaryElement,
                          size: const Size.square(8),
                          activeSize: const Size(20, 8),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(BuildContext context, int index, String buttonName, String title,
      String subtitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          height: 345.w,
          width: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              // sp is for font size
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
          ),
          child: Text(
            subtitle,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              // sp is for font size
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // within 0-2 index
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              // jump to new page
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(SignIn.routeName, (route) => false);
            }
          },
          child: Container(
            width: 325.w,
            height: 50.w,
            margin: EdgeInsets.only(
              top: 100.h,
              left: 25.w,
              right: 25.w,
            ),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.w),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    // spreadradius should be bigger than blurradius and close to each other
                    blurRadius: 1,
                    spreadRadius: 2,
                    // positve x -> right inclined, positive y -> down
                    offset: Offset(0, 1),
                  ),
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  // sp is for font size
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
                // textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
