import 'package:get/get.dart';
import 'package:news/constants.dart/news_urls.dart';
import 'package:news/models/response_model.dart';
import 'package:news/repositories/api.dart';

class MostPopularRepository extends GetConnect {
  Future<ResponseModel> fetchMostPopular(
      {required String section, required int period}) async {
    final url = NewsUrls().getMostPopularUrl(section: section, period: period);
    final headers = ApiServices().getHeaders();
    ResponseModel responseModel = ResponseModel();

    await get(url, headers: headers).then((response) async {
      if (response.status.hasError) {
        return Future.error(Exception(response.statusText));
      } else {
        responseModel = ResponseModel.fromJson(response.body);
        return responseModel;
      }
    });

    return responseModel;
  }
}
