import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/controllers/silver_controller.dart';
import 'package:news/helper/helpers.dart';
import 'package:news/helper/theme/app_colors.dart';
import 'package:news/views/widgets/home_widget.dart/background_silver_widget.dart';

class FlexibleSpaceBarHeaderWidget extends StatelessWidget {
  const FlexibleSpaceBarHeaderWidget(
      {Key? key, required this.valueScroll, required this.controller})
      : super(key: key);
  final double valueScroll;
  final SliverScrollController controller;
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Obx(
      () => SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        stretch: true,
        expandedHeight: 240,
        pinned: valueScroll < 0 ? true : false,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            stretchModes: const [StretchMode.zoomBackground],
            background: Stack(
              fit: StackFit.expand,
              children: [
                const BackgroundSliverWidget(),
                Positioned(
                  left: 10,
                  bottom: (sizeHeight + 30) - controller.valueScroll.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      appText("The NewTimes",
                          textStyle: GoogleFonts.roboto(
                              color: AppColors.greyColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: sizeWidth - 100,
                        child: appText(
                            "Increase of public servants's pay will depend on economy  official.  As the economy continues to recover, salaries for public servants might also increase",
                            textStyle: GoogleFonts.lora(
                              color: AppColors.greyColor,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.visible),
                      ),
                      height(4),
                      appText(
                        "Dubai",
                        textStyle: GoogleFonts.albertSans(
                          color: AppColors.redColor,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  top: (sizeHeight + 20) - controller.valueScroll.value,
                  child: const Icon(
                    Icons.menu,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
