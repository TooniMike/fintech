import 'package:fintech/core/common/widgets/all_widgets.dart';
import 'package:fintech/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextAmount extends StatefulWidget {
  const TextAmount({super.key});

  @override
  State<TextAmount> createState() => _TextAmountState();
}

class _TextAmountState extends State<TextAmount> {
  bool isDot = false;
  String userInput = '₦';
  // String userInput = '0';
  List<String> buttonList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
    'C',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF10194E),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        resultWidget(),
        Expanded(child: buttonWidget()),
        const WhiteSpace(
          height: 20,
        ),
        CustomButton(
          text: 'Send money',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          },
        ),
      ]),
    );
  }

  Widget resultWidget() {
    return Container(
      color: const Color(0xFF10194E),
      child: Container(
        padding: const EdgeInsets.all(0),
        alignment: Alignment.center,
        child: Text(userInput,
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }

  Widget buttonWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color(0xFF10194E),
      child: GridView.builder(
        itemCount: buttonList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 5.w, crossAxisSpacing: 25.h),
        itemBuilder: ((context, index) {
          return button(buttonList[index]);
        }),
      ),
    );
  }

  handleButtonPress(String text) {
    if (text == 'C') {
      userInput = '';
      // result = '0.00';
      return;
    }
    userInput = userInput + text;
  }

  Widget button(String text) {
    return InkWell(
      onTap: () {
        setState(() {
          handleButtonPress(text);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
