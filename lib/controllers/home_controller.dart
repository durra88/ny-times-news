import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:news/models/most_popular_news_model.dart';
import 'package:news/repositories/most_popular_repository.dart';

class HomeController extends GetxController with StateMixin {
  RxList<MostPopularNewsModel> mostPopularNewsModel =
      <MostPopularNewsModel>[].obs;
  MostPopularRepository mostPopularRepository = MostPopularRepository();
  @override
  void onInit() {
    fetchMostPopulrNews(section: "all-sections", period: 7);
    super.onInit();
  }

  fetchMostPopulrNews({required String section, required int period}) async {
    await mostPopularRepository
        .fetchMostPopular(section: section, period: period)
        .then((response) {
      log("_____________________ news  ${jsonEncode(response.status)}");

      mostPopularNewsModel.value = response.results ?? [];
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
