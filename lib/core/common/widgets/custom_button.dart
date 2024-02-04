import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isColorFilled;
  const CustomButton(
      {super.key, this.isColorFilled = true, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
