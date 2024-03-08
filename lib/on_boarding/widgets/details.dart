import 'package:fintech/authentication/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/common_widgets/all_widgets.dart';

class Details extends StatelessWidget {
  final bool isFirstPage;
  const Details({super.key, this.isFirstPage = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width * .85,
      decoration: BoxDecoration(
        color: isFirstPage ? const Color(0xFF17288E) : Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(60.r)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
            .copyWith(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WhiteSpace(
              height: 35,
            ),
            Text(
              isFirstPage
                  ? 'Transfer That is Safe'
                  : 'Transfer Money With Ease',
              style: TextStyle(
                  color: isFirstPage ? Colors.white : const Color(0xFF17288E),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            ).animate().slideX(
                  begin: -2,
                  end: 0,
                  delay: 200.ms,
                  duration: 1100.ms,
                  curve: Curves.easeInOutCubic),
            const WhiteSpace(
              height: 10,
            ),
            Text(
              isFirstPage
                  ? 'You have nothing to be scared about, we got you covered.'
                  : 'Making money is hard enough, we make transferring it easy enough.',
              style: TextStyle(
                  color: isFirstPage ? Colors.white : const Color(0xFF17288E),
                  fontSize: 15.sp),
            ).animate().scaleXY(
                begin: 0,
                end: 1,
                delay: 200.ms,
                duration: 1000.ms,
                curve: Curves.easeInOutCubic),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
              child: Container(
                height: 60.h,
                width: 150.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    color:
                        isFirstPage ? Colors.white : const Color(0xFF1C265C)),
                child: Center(
                    child: Text(
                  'Start banking',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          isFirstPage ? const Color(0xFF17288E) : Colors.white,
                      fontSize: 16.sp),
                ).animate().scaleXY(
                        begin: 0,
                        end: 1,
                        delay: 500.ms,
                        duration: 1100.ms,
                        curve: Curves.easeInOutCubic),
                        ),
              ).animate().slideY(
                  begin: 2,
                  end: 0,
                  delay: 500.ms,
                  duration: 1100.ms,
                  curve: Curves.easeInOutCubic),
            )
          ],
        ),
      ),
    );
  }
}
