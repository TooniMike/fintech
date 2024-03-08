import 'package:fintech/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/common_widgets/all_widgets.dart';
import '../core/res/image_res.dart';
import 'all_pages.dart';

class MoneyRequest extends StatelessWidget {
  const MoneyRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Stack(
          children: [
            Positioned(
              top: 0.h,
              child: Image.asset(Assets.vector),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        const WhiteSpace(
                          width: 1,
                        ),
                        Expanded(
                          child: Text(
                            'Back',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'New Request',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                  const WhiteSpace(
                    height: 60,
                  ),
                  Stack(
                    children: [
                      Image.asset(Assets.ell3).animate().scaleXY(
                          begin: 0,
                          end: 1,
                          delay: 200.ms,
                          duration: 1100.ms,
                          curve: Curves.easeInOutCubic),
                      Positioned(
                        top: 25.h,
                        left: 25.w,
                        child: Image.asset(Assets.ell2).animate().scaleXY(
                            begin: 0,
                            end: 1,
                            delay: 400.ms,
                            duration: 1100.ms,
                            curve: Curves.easeInOutCubic),
                      ),
                      Positioned(
                        top: 50.h,
                        left: 50.w,
                        child: Image.asset(Assets.ell1).animate().scaleXY(
                            begin: 0,
                            end: 1,
                            delay: 800.ms,
                            duration: 1100.ms,
                            curve: Curves.easeInOutCubic),
                      )
                    ],
                  ),
                  const WhiteSpace(
                    height: 30,
                  ),
                  Text(
                    'Adeleke Ramon',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500),
                  ).animate().scaleXY(
                begin: 0,
                end: 1,
                delay: 100.ms,
                duration: 1000.ms,
                curve: Curves.easeInOutCubic),
                  const WhiteSpace(
                    height: 20,
                  ),
                  Text(
                    'is requesting for:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  const WhiteSpace(
                    height: 20,
                  ),
                  Text(
                    'N200,000',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold),
                  ).animate().slideY(
                      begin: 2,
                      end: 0,
                      delay: 500.ms,
                      duration: 1100.ms,
                      curve: Curves.easeInOutCubic),
                  const WhiteSpace(
                    height: 20,
                  ),
                  CustomButton(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const SearchRecipent()),
                      );
                    },
                    text: 'Send money',
                    isColorFilled: true,
                  ),
                  const WhiteSpace(
                    height: 20,
                  ),
                  CustomButton(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    text: 'Don\'t send',
                    isColorFilled: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
