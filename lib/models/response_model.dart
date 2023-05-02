import 'package:news/models/most_popular_news_model.dart';

class ResponseModel {
  String? status;
  String? copyright;
  int? numResults;
  List<MostPopularNewsModel>? results;

  ResponseModel({this.status, this.copyright, this.numResults, this.results});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    numResults = json['num_results'];
    if (json['results'] != null) {
     results = <MostPopularNewsModel>[];
      json['results'].forEach((v) {
        results!.add(MostPopularNewsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['copyright'] = copyright;
    data['num_results'] = numResults;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
