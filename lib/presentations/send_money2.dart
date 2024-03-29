import 'package:flutter/material.dart';

import 'all_pages.dart';

class SendAllMoney extends StatelessWidget {
  const SendAllMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Stack(
      children: [
        const SearchRecipent(),
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.6)
          ),
        ),
        const SendMoney()
      ],
    ));
  }
}
