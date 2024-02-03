import 'package:fintech/core/res/image_res.dart';
import 'package:fintech/on_boarding/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
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
            child: Image.asset(Assets.vector1),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .5,
            child: Image.asset(Assets.vector2),
          ),
          Positioned(
            top: 0.h,
            right: 0.w,
            child: Image.asset(Assets.vector4),
          ),
          Positioned(
            top: 20.h,
            right: 0.w,
            child: Image.asset(Assets.triangle1),
          ),
          Positioned(
            top: 0.h,
            left: 0.w,
            child: Image.asset(Assets.vector5),
          ),
          Positioned(
            top: 130.h,
            left: 0.w,
            child: Image.asset(Assets.ellipse1),
          ),
          Positioned(
            top: 165.h,
            left: 0.w,
            child: Image.asset(Assets.ellipse2),
          ),
          Positioned(
            top: 0.h,
            bottom: 0.h,
            left: MediaQuery.of(context).size.width * .173,
            child: Image.asset(Assets.ellipse3),
          ),
          Positioned(
            top: 0.h,
            bottom: 0.h,
            right: MediaQuery.of(context).size.width * .173,
            child: Image.asset(Assets.ellipse4),
          ),
          Positioned(
            top: 0.h,
            bottom: 0.h,
            left: MediaQuery.of(context).size.width * .125,
            child: Image.asset(Assets.triangle3),
          ),
          Positioned(
            top: 0.h,
            bottom: 0.h,
            right: MediaQuery.of(context).size.width * .125,
            child: Image.asset(Assets.triangle2),
          ),
          Positioned(
            top: 0.h,
            bottom: 0.h,
            right: 0.w,
            left: 0.w,
            child: Image.asset(Assets.lock),
          ),
          Positioned(
            bottom: 0.h,
            right: 10.w,
            child: Image.asset(Assets.vector3),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: Details()),
        ],
      ),
    );
  }
}
