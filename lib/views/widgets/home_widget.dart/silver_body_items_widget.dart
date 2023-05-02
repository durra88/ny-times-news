import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/controllers/home_controller.dart';
import 'package:news/helper/helpers.dart';
import 'package:news/helper/string/most_popular_news_string.dart';
import 'package:news/helper/theme/app_colors.dart';
import 'package:news/models/most_popular_news_model.dart';
import 'package:news/views/news_screens/detail_page.dart';

class SliverBodyItemsWidget extends StatelessWidget {
  const SliverBodyItemsWidget({Key? key, required this.news}) : super(key: key);
  final List<MostPopularNewsModel> news;

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (homeController) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            MostPopularNewsModel newItem = news[index];
            getImage(newItem);

            return InkWell(
              onTap: () {
                Get.to(DetailPage(
                  detail: newItem,
                ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Hero(
                            tag: newItem.id!,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              height: 140,
                              width: 130,
                              child: CachedNetworkImage(
                                imageUrl: "${getImage(newItem)[medium]}",
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) =>
                                    const Center(
                                  child: Icon(Icons.image),
                                ),
                                progressIndicatorBuilder:
                                    (context, url, progress) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          ),
                          width(8),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  appText(
                                      checkValueNullOrEmpty("${newItem.title}"),
                                      textStyle: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: AppColors.whiteColor),
                                      overflow: TextOverflow.visible),
                                  height(8),
                                  appText(
                                    checkValueNullOrEmpty(
                                        newItem.abstract?.capitalizeFirst!),
                                    textStyle: GoogleFonts.lora(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                        color: AppColors.lightGrey),
                                  ),
                                  height(8),
                                  appText(
                                    convertDateYYYYMMDDToHumanReadableFormat(
                                        newItem.publishedDate ?? ""),
                                    textStyle: GoogleFonts.lora(
                                        fontSize: 11,
                                        color: AppColors.greyColor),
                                  ),
                                  height(8),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (index == news.length - 1) ...[
                      height(
                        32,
                      ),
                      Container(
                        height: 0.5,
                        color: Colors.white.withOpacity(0.3),
                      )
                    ]
                  ],
                ),
              ),
            );
          },
          childCount: news.length,
        ),
      );
    });
  }
}
