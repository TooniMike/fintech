import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/all_widgets.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomLeft,
          children: [
          PageView(
            controller: pageController,
            children: const [
              FirstPage(),
              SecondPage(),
            ],
          ),
          Positioned(
            bottom: 180.h,
            left: 25.w,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 2,
              effect: WormEffect(
                  dotHeight: 8.h,
                  dotWidth: 36.w,
                  spacing: 10,
                  dotColor: const Color(0xFFFDD590),
                  activeDotColor: const Color(0xFFFFB129)),
            ),
          )
        ]),
      ),
    );
  }
}
