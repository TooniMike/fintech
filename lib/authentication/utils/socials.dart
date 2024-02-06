import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/common_widgets/all_widgets.dart';

class Socials extends StatelessWidget {
  const Socials({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _social(const Color(0xFFDB4437), 'gmail', context),
        WhiteSpace(
          width: 20.w,
        ),
        _social(const Color(0xFF4267B2), 'facebook', context),
        WhiteSpace(
          width: 20.w,
        ),
        _social(const Color(0xFF1DA1F2), 'twitter', context)
      ],
    );
  }

  Widget _social(Color? color, String? image, BuildContext context) {
    return GestureDetector(
      onTap: () {
        SnackbarHelper.showSnackBar(context: context);
      },
      child: Container(
        width: 50.0.w,
        height: 50.0.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Image.asset('assets/images/$image.png'),
        ),
      ),
    );
  }
}
