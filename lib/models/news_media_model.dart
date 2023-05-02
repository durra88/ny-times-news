import 'package:news/models/media_meta_data_model.dart';

class NewsMediaModel {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<MediaMetadata>? mediaMetadata;

  NewsMediaModel(
      {this.type,
      this.subtype,
      this.caption,
      this.copyright,
      this.approvedForSyndication,
      this.mediaMetadata});

  NewsMediaModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    subtype = json['subtype'];
    caption = json['caption'];
    copyright = json['copyright'];
    approvedForSyndication = json['approved_for_syndication'];
    if (json['media-metadata'] != null) {
      mediaMetadata = <MediaMetadata>[];
      json['media-metadata'].forEach((v) {
        mediaMetadata!.add(MediaMetadata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['subtype'] = subtype;
    data['caption'] = caption;
    data['copyright'] = copyright;
    data['approved_for_syndication'] = approvedForSyndication;
    if (mediaMetadata != null) {
      data['media-metadata'] = mediaMetadata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
