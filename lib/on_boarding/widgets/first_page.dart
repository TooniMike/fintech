import 'package:fintech/core/res/image_res.dart';
import 'package:fintech/on_boarding/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF010A43),
      body: Stack(
        children: [
          Positioned(
            top: 50.h,
            child: Image.asset(Assets.vector1).animate().slide(
                delay: 500.ms, duration: 1100.ms, curve: Curves.easeInOutCubic),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .5,
            child: Image.asset(Assets.vector2),
          ),
          Positioned(
            top: 0.h,
            right: 0.w,
            child: Image.asset(Assets.vector4).animate().slideX(
                begin: 2,
                end: 0,
                delay: 200.ms,
                duration: 1100.ms,
                curve: Curves.easeInOutCubic),
          ),
          Positioned(
            top: 20.h,
            right: 0.w,
            child: Image.asset(Assets.triangle1).animate().scaleXY(
                begin: 0,
                end: 1,
                delay: 200.ms,
                duration: 1100.ms,
                curve: Curves.easeInOutCubic)
          ),
          Positioned(
            top: 0.h,
            left: 0.w,
            child: Image.asset(Assets.vector5).animate().slideX(
                begin: -2,
                end: 0,
                delay: 500.ms,
                duration: 1100.ms,
                curve: Curves.easeInOutCubic),
          ),
          Positioned(
            top: 130.h,
            left: 0.w,
            child: Image.asset(Assets.ellipse1).animate().slideX(
                begin: -2,
                end: 0,
                delay: 800.ms,
                duration: 1100.ms,
                curve: Curves.easeInOutCubic),
          ),
          Positioned(
            top: 165.h,
            left: 0.w,
            child: Image.asset(Assets.ellipse2).animate().slideX(
                begin: -2,
                end: 0,
                delay: 500.ms,
                duration: 1000.ms,
                curve: Curves.easeInOutCubic),
          ),
          Positioned(
            top: 0.h,
            bottom: 0.h,
            left: MediaQuery.of(context).size.width * .173,
            child: Image.asset(Assets.ellipse3)
            // .animate().scaleXY(
            //     begin: 0,
            //     end: 1,
            //     delay: 500.ms,
            //     duration: 1100.ms,
            //     curve: Curves.easeInOutCubic),
          ),
          Positioned(
            top: 0.h,
            bottom: 0.h,
            right: MediaQuery.of(context).size.width * .173,
            child: Image.asset(Assets.ellipse4)
            // .animate().scaleXY(
            //     begin: 0,
            //     end: 1,
            //     delay: 500.ms,
            //     duration: 1100.ms,
            //     curve: Curves.easeInOutCubic),
          ),
          Positioned(
            top: 0.h,
            bottom: 0.h,
            left: MediaQuery.of(context).size.width * .125,
            child: Image.asset(Assets.triangle3).animate().scaleXY(
                begin: 0,
                end: 1,
                delay: 700.ms,
                duration: 1100.ms,
                curve: Curves.easeInOutCubic),
          ),
          Positioned(
            top: 0.h,
            bottom: 0.h,
            right: MediaQuery.of(context).size.width * .125,
            child: Image.asset(Assets.triangle2).animate().scaleXY(
                begin: 0,
                end: 1,
                delay: 700.ms,
                duration: 1100.ms,
                curve: Curves.easeInOutCubic),
          ),
          Positioned(
            top: 0.h,
            bottom: 0.h,
            right: 0.w,
            left: 0.w,
            child: Image.asset(Assets.lock).animate().scaleXY(
                begin: 0,
                end: 1,
                delay: 900.ms,
                duration: 1100.ms,
                curve: Curves.easeInOutCubic),
          ),
          Positioned(
            bottom: 0.h,
            right: 10.w,
            child: Image.asset(Assets.vector3),
          ),
          const Positioned(bottom: 0, left: 0, child: Details()),
        ],
      ),
    );
  }
}
