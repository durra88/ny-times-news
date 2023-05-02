import 'package:news/constants.dart/server_info.dart';

class NewsUrls {
  final String _baseURL = AppUrls().baseURL;
  final String _apiKey = AppUrls().apiKey;

  getMostPopularUrl({required String section, required int period}) {
    return '$_baseURL/$section/$period.json?api-key=$_apiKey';
  }
}
