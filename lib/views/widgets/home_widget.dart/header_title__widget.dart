import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/controllers/silver_controller.dart';

const _maxHeaderExtent = 30.0;
typedef OnHeaderChange = void Function(bool visible);

class HeaderTitleWidget extends SliverPersistentHeaderDelegate {
  HeaderTitleWidget({required this.title, required this.controller});
  final SliverScrollController controller;
  final String title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExtent;

    if (percent > 0.1) {
      controller.visibleHeader.value = true;
    } else {
      controller.visibleHeader.value = false;
    }
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: controller.visibleHeader.value ? Colors.white : null,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        title,
        style: GoogleFonts.lora(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: controller.visibleHeader.value ? Colors.black : Colors.white,
        ),
      ),
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
