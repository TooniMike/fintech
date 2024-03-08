import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/res/image_res.dart';
import 'all_widgets.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF010A43),
      body: Stack(
        children: [
          Positioned(
            top: 0.h,
            right: 0.w,
            child: Image.asset( Assets.vec11),
          ),
          Positioned(
            top: 0.h,
            right: 0.w,
            child: Image.asset(Assets.vec13),
          ),
          Positioned(
            left: 35.w,
            top: 220.h,
            child: Image.asset(Assets.vec10),
          ),
          Positioned(
            top: 0.h,
            left: 0.w,
            child: Image.asset(Assets.vec15),
          ),
          Positioned(
            top: 0.h,
            left: 0.w,
            child: Image.asset(Assets.vec12),
          ),
          Positioned(
            top: 25.h,
            left: 15.w,
            child: Image.asset(Assets.vec14),
          ),
          Positioned(
            top: 190.h,
            right: 70.w,
            child: Image.asset(Assets.vec9),
          ),
          Positioned(
            top: 225.h,
            right: 105.w,
            child: Image.asset(Assets.vec8).animate().scaleXY(
                begin: 0,
                end: 1,
                delay: 500.ms,
                duration: 1100.ms,
                curve: Curves.easeInOutCubic),
          ),
          Positioned(
            top: 350.h,
            left: 0.w,
            child: Image.asset(Assets.vec2),
          ),
          Positioned(
            top: 155.h,
            left: 0.w,
            child: Image.asset(Assets.vec7).animate().slideX(
                begin: -2,
                end: 0,
                delay: 500.ms,
                duration: 1000.ms,
                curve: Curves.easeInOutCubic),
          ),
          Positioned(
            top: 225.h,
            left: 0.w,
            child: Image.asset(Assets.vec6).animate().slideX(
                begin: -2,
                end: 0,
                delay: 800.ms,
                duration: 1000.ms,
                curve: Curves.easeInOutCubic),
          ),
          Positioned(
            height: 80.h,
            top: 370.h,
            right: 0.w,
            child: Image.asset(Assets.vec5).animate().slideX(
                begin: 2,
                end: 0,
                delay: 800.ms,
                duration: 1000.ms,
                curve: Curves.easeInOutCubic),
          ),
          Positioned(
            height: 40.h,
            top: 385.h,
            right: 22.w,
            child: Image.asset(Assets.vec4).animate().scaleXY(
                begin: 0,
                end: 1,
                delay: 500.ms,
                duration: 1100.ms,
                curve: Curves.easeInOutCubic),
          ),
          Positioned(
            height: 20.h,
            top: 395.h,
            right: 32.w,
            child: Image.asset(Assets.vec3).animate().scaleXY(
                begin: 0,
                end: 1,
                delay: 900.ms,
                duration: 1100.ms,
                curve: Curves.easeInOutCubic),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: Details(
              isFirstPage: false,
            ),
          ),
        ],
      ),
    );
  }
}
