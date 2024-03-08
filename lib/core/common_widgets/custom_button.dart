import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isColorFilled;
  final void Function() onTap;
  const CustomButton(
      {super.key, this.isColorFilled = true, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: 150.w,
        decoration: BoxDecoration(
          color: isColorFilled ? const Color(0xFFFF2E63) : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            width: 2.h,
            color: isColorFilled ? Colors.transparent : const Color(0xFF464E8A),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isColorFilled ? Colors.white : const Color(0xFF464E8A),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    ).animate()
            .slideY(
                begin: 2,
                end: 0,
                delay: 500.ms,
                duration: 1100.ms,
                curve: Curves.easeInOutCubic);
  }
}
