import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_amount.dart';

class SendMoney extends StatelessWidget {
  const SendMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.cancel, color: Colors.white, size: 40.h,)),
              const Spacer(),
              Container(
                height: MediaQuery.of(context).size.height *.8,
                decoration: BoxDecoration(
                  color: const Color(0xFF10194E),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(45.r), topRight: Radius.circular(45.r))
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 10.h),
                  child: const TextAmount(),
                ),
              ),
            ],
          ),
        )
        
      ),
    );
  }
}