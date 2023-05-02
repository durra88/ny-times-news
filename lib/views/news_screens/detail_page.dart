import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/helper/helpers.dart';
import 'package:news/helper/string/most_popular_news_string.dart';
import 'package:news/helper/theme/app_colors.dart';
import 'package:news/models/most_popular_news_model.dart';
import 'package:news/views/widgets/detail_widget.dart/image_widget.dart';
import 'package:news/views/widgets/detail_widget.dart/info_widget.dart';

class DetailPage extends StatefulWidget {
  final MostPopularNewsModel? detail;
  const DetailPage({Key? key, required this.detail}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    data = widget.detail;

    super.initState();
  }

  MostPopularNewsModel? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            toolbarHeight: 150,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: AppColors.greyColor),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 14.0,
                    ),
                  ),
                ),
              ),
            ),
            title: appText(
              checkValueNullOrEmpty("${data?.source}"),
              textStyle: GoogleFonts.lora(color: Colors.black),
            ),
            elevation: 4,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            foregroundColor: Colors.black,
            bottom: PreferredSize(
              preferredSize: Size.square(newsDetailsImageAreaSize(context)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.category,
                            size: 14, color: AppColors.redColor),
                        width(4),
                        appText(
                          checkValueNullOrEmpty("${data?.section}"),
                          textStyle: GoogleFonts.lora(color: Colors.black),
                        ),
                        width(4),
                      ],
                    ),
                    height(8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      child: appText(
                          "Time new roman blue he hernew roman blue new roman blue new roman blue new roman blue   we admire you ",
                          // '${widget.detail?.title}',
                          textStyle: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.visible),
                    ),
                    height(8),
                    Row(
                      children: [
                        const Icon(Icons.person,
                            size: 14, color: AppColors.blueColor),
                        width(4),
                        appText(
                          getShortName("${data?.byline}"),
                          textStyle: GoogleFonts.lora(
                              color: AppColors.blackColor, fontSize: 11),
                        ),
                        width(4),
                        appText(
                          convertDateYYYYMMDDToHumanReadableFormat(
                              data?.publishedDate ?? ""),
                          textStyle: GoogleFonts.lora(
                              color: AppColors.greyColor, fontSize: 11),
                        ),
                      ],
                    ),
                    height(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: SizedBox(
                            width: double.infinity,
                            height: newsDetailsImageAreaSize(context) * 0.7,
                            child: Hero(
                              tag: widget.detail?.id ?? "",
                              child: ImageWidget(
                                  imageUrl: "${getImage(data!)[medium]}"),
                            ),
                          ),
                        ),
                        InfoWidget(
                          name: checkValueNullOrEmpty(
                              "${data?.media?.first.copyright}"),
                          caption: checkValueNullOrEmpty(
                              "${data?.media?.first.caption}"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: appText(checkValueNullOrEmpty("${data?.title}"),
                  textStyle: GoogleFonts.roboto(fontWeight: FontWeight.w900),
                  overflow: TextOverflow.visible),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: appText(
                  checkValueNullOrEmpty(
                      "${data?.abstract} ${data?.abstract} ${data?.abstract} ${data?.abstract}"),
                  textStyle: GoogleFonts.lora(
                      fontWeight: FontWeight.w400, fontSize: 14),
                  overflow: TextOverflow.visible),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: appText(checkValueNullOrEmpty("${data?.abstract}"),
                  textStyle: GoogleFonts.roboto(fontWeight: FontWeight.w900),
                  overflow: TextOverflow.visible),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: appText(
                  checkValueNullOrEmpty(
                      "${data?.title} ${data?.abstract}  ${data?.abstract}"),
                  textStyle: GoogleFonts.lora(
                      fontWeight: FontWeight.w400, fontSize: 14),
                  overflow: TextOverflow.visible),
            ),
          ],
        ),
      ),
    ));
  }
}
