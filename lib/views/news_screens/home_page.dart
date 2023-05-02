import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controllers/connectivity_controller.dart';
import 'package:news/controllers/home_controller.dart';
import 'package:news/controllers/silver_controller.dart';
import 'package:news/helper/string/most_popular_news_string.dart';
import 'package:news/helper/theme/app_colors.dart';
import 'package:news/views/internet_connection_screen.dart';
import 'package:news/views/widgets/export_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SliverScrollController sliverScrollController =
      Get.find<SliverScrollController>();
  HomeController homeController = Get.find<HomeController>();
  ConnectivityController connectivityController =
      Get.find<ConnectivityController>();
  List<String> categories = [allSections, health, economic, art, entertainment];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Scrollbar(
        radius: const Radius.circular(8),
        notificationPredicate: (scroll) {
          sliverScrollController.valueScroll.value =
              scroll.metrics.extentInside;
          return true;
        },
        child: Obx(() => connectivityController.connectionStatus.value == 0
            ? const CheckInternetWidget()
            : GetX<HomeController>(builder: (homeController) {
                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: sliverScrollController.scrollControllerGlobally,
                  slivers: [
                    FlexibleSpaceBarHeaderWidget(
                        valueScroll:
                            sliverScrollController.globalOffsetValue.value,
                        controller: sliverScrollController),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: HeaderSliverWidget(
                          controller: sliverScrollController,
                          categories: categories),
                    ),
                    SliverBodyItemsWidget(
                      news: homeController.mostPopularNewsModel,
                    )
                  ],
                );
              })),
      ),
    );
  }
}
