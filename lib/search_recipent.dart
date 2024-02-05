import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/common/widgets/all_widgets.dart';
import 'core/res/image_res.dart';

class SearchRecipent extends StatelessWidget {
  const SearchRecipent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // backgroundColor: AppColors.primaryColor,
      backgroundColor: const Color(0xFF010A43),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w).copyWith(top: 20.h),
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                const WhiteSpace(
                  width: 1,
                ),
                Text(
                  'Back',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
                const WhiteSpace(
                  width: 30,
                ),
                Expanded(
                  child: SizedBox(
                    height: 50.h,
                    child: TextField(
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      keyboardType: TextInputType.name,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: 'Search the Recipient',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0.r),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0.r),
                              borderSide:
                                  const BorderSide(color: Color(0xFF1DC7AC))),
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white38,
                          ),
                          suffixIcon:
                              const Icon(Icons.search, color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const WhiteSpace(height: 10),
          Stack(
            children: [
              Image.asset(Assets.ell20),
              Positioned(
                top: 0.h,
                bottom: 0.h,
                left: 0.w,
                right: 0.w,
                child: Image.asset(Assets.ell21),
              ),
              Positioned(
                top: 0.h,
                bottom: 0.h,
                left: 0.w,
                right: 0.w,
                child: Image.asset(Assets.ell22),
              ),
              Positioned(
                  top: 10.h,
                  left: 0.w,
                  right: 0.w,
                  child: _searchPersons('Adedoyin Leke', Assets.ell16, false)),
              Positioned(
                  top: 60.h,
                  left: 10.w,
                  child: _searchPersons(
                      'Adelaide Uti (son)', Assets.ell15, false)),
              Positioned(
                  top: 120.h,
                  right: 10.w,
                  child:
                      _searchPersons('Adeleke Adeyanju', Assets.ell13, true)),
              Positioned(
                  top: 180.h,
                  left: 30.w,
                  child:
                      _searchPersons('Adolph colleague', Assets.ell14, false)),
              Positioned(
                  top: 250.h,
                  right: 20.w,
                  child: _searchPersons('Adedoyin Leke', Assets.ell24, false)),
              Positioned(
                  bottom: 10.h,
                  right: 0.w,
                  left: 0.w,
                  child: _searchPersons('Aduni Wale', Assets.ell23, false)),
            ],
          ),
          const WhiteSpace(height: 5),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xFF10194E),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
                child: Column(
                  children: [
                    Container(
                      height: 6,
                      width: 60,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 20),
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white24),
                    ),
                    const WhiteSpace(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 30.r,
                      backgroundImage: const AssetImage(Assets.ell13),
                    ),
                    Text(
                      'Adeleke Adeyanju',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp),
                    ),
                    const WhiteSpace(height: 5,),
                    Text(
                      '(+234)905 1694 275',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp),
                    ),
                    const WhiteSpace(height: 10,),
                    const CustomButton(text: 'Continue', isColorFilled: true,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

Widget _searchPersons(String name, String image, bool isSearch) {
  return Column(
    children: [
      CircleAvatar(
        radius: isSearch ? 30.r : 20.r,
        backgroundImage: AssetImage(image),
      ),
      Text(
        name,
        style: TextStyle(
            color: isSearch ? Colors.green[300] : Colors.white,
            fontSize: isSearch ? 14.sp : 12.sp),
      )
    ],
  );
}
