import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/controllers/silver_controller.dart';
import 'package:news/helper/helpers.dart';

class ListItemHeaderSliverWidget extends StatelessWidget {
  const ListItemHeaderSliverWidget(
      {Key? key, required this.controller, required this.categories})
      : super(key: key);
  final SliverScrollController controller;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: NotificationListener<ScrollNotification>(
        onNotification: ((notification) => true),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: GetX<SliverScrollController>(builder: (controller) {
            return Row(
              children: List.generate(categories.length, (index) {
                return Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: index == controller.headerNotifier.value.index
                        ? Colors.white
                        : null,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: appText(
                    categories[index],
                    textStyle: GoogleFonts.lora(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: index == controller.headerNotifier.value.index
                          ? Colors.black
                          : Colors.white,
                    ),

                    
                  ),
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}
