import 'package:flutter/material.dart';
import 'package:news/helper/helpers.dart';
import 'package:news/helper/theme/app_colors.dart';

class SliverHeaderDataWidget extends StatelessWidget {
  const SliverHeaderDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Text(
          " China .     Korea .      Japan.",
          style: TextStyle(fontSize: 14, color: AppColors.whiteColor),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          children: [
            const Icon(Icons.access_time,
                size: 14, color: AppColors.whiteColor),
            width(4),
            const Text(
              "30-40min    4.3",
              style: TextStyle(fontSize: 12, color: AppColors.whiteColor),
            ),
            width(6),
            const Icon(Icons.star, size: 14, color: AppColors.whiteColor),
            width(8),
            const Icon(Icons.remove_red_eye_rounded,
                size: 14, color: AppColors.whiteColor),
                  width(4),
            const Text(
              "\$6.5M",
              style: TextStyle(fontSize: 12, color: AppColors.whiteColor),
            ),
          ],
        )
      ]),
    );
  }
}
