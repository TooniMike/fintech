import 'package:flutter/material.dart';

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      const SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            color: Colors.blueAccent,
          )),
      Center(child: Image.asset('assets/images/gmail.png', width: 30)),
    ]);
  }
}
