import 'package:flutter/material.dart';

class BackgroundSliverWidget extends StatelessWidget {
  const BackgroundSliverWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        "images/ny_background.jpg",
        fit: BoxFit.cover,
        colorBlendMode: BlendMode.darken,
        color: Colors.black.withOpacity(0.5),
      ),
    );
  }
}
