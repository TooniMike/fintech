import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MotionLoading extends StatelessWidget {
  const MotionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 60.0.h,
        child: Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 19, 80, 170),
          highlightColor: const Color.fromARGB(255, 55, 110, 194),
          child: Container(
            height: 40.h,
            decoration: const BoxDecoration(
                color: Color(0xFF10194E),
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ));
  }
}
