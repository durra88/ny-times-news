import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/controllers/silver_controller.dart';
import 'package:news/helper/helpers.dart';
import 'package:news/helper/theme/app_colors.dart';
import 'package:news/views/widgets/export_widget.dart';

const _maxHeaderExtent = 120.0;

class HeaderSliverWidget extends SliverPersistentHeaderDelegate {
  HeaderSliverWidget({required this.controller, required this.categories});
  final SliverScrollController controller;
  List<String> categories;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExtent;

    if (percent > 0.1) {
      controller.visibleHeader.value = true;
    } else {
      controller.visibleHeader.value = false;
    }
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 0,
          child: Container(
            height: _maxHeaderExtent,
            color: Colors.black,
            child: Column(
              children: [
                height(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      AnimatedOpacity(
                        opacity: percent > 0.1 ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: const Icon(
                          Icons.menu,
                          color: AppColors.lightGrey,
                        ),
                      ),
                      AnimatedSlide(
                        duration: const Duration(microseconds: 300),
                        offset: Offset(percent < 0.1 ? -0.18 : 0.1, 0),
                        curve: Curves.easeIn,
                        child: Text(
                          "The NewTimes",
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Expanded(
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: percent > 0.0
                          ? ListItemHeaderSliverWidget(
                              controller: controller,
                              categories: categories,
                            )
                          : const SliverHeaderDataWidget()),
                )
              ],
            ),
          ),
        ),
        if (percent > 0.1)
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: percent > 0.1
                      ? Container(
                          height: 0.5,
                          color: AppColors.redColor,
                        )
                      : null))
      ],
    );
  }

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _maxHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
