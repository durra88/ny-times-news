import 'package:get/get.dart';
import 'package:news/bindings/home_binging.dart';
import 'package:news/models/most_popular_news_model.dart';
import 'package:news/views/news_screens/detail_page.dart';
import 'package:news/views/news_screens/home_page.dart';

MostPopularNewsModel newsDetail = MostPopularNewsModel();

class RoutesClass {
  static String homePage = "/";
  static String detailPage = "/detailpage";
  static String getHomeRoute() => homePage;
    static String getDetailPage() => detailPage;

  static List<GetPage> routes = [
    GetPage(name: homePage, page: () => const HomePage(), binding: Binding()),
    GetPage(
        name: detailPage,
        page: () => DetailPage(
              detail: newsDetail,
            ),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 400)),
  ];
}
