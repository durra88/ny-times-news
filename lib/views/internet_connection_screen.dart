import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news/helper/helpers.dart';

class CheckInternetWidget extends StatelessWidget {
  const CheckInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 50),
      child: FittedBox(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: appText("No Internet",
                    fontSize: 30, fontWeight: FontWeight.w300),
              ),
              Lottie.asset('images/no-internet_img.json',
                  width: 300, height: 240),
              height(30)
            ]),
      ),
    );
  }
}
