import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news/helper/string/most_popular_news_string.dart';
import 'package:news/helper/theme/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:news/models/most_popular_news_model.dart';

SizedBox height(double height) {
  return SizedBox(height: height);
}

SizedBox width(double width) {
  return SizedBox(width: width);
}

Text appText(
  str, {
  TextStyle? textStyle,
  fontName,
  fontSize,
  color,
  fontWeight,
  textAlign,
  overflow,
}) {
  return Text(
    str,
    textAlign: textAlign ?? TextAlign.left,
    overflow: overflow ?? TextOverflow.ellipsis,
    style: textStyle ??
        GoogleFonts.alata(
          fontSize: fontSize != null ? fontSize.toDouble() : 14,
          color: color ?? AppColors.whiteColor,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
  );
}

checkValueNullOrEmpty(String? value) {
  if (value == null || value == "" || value == "null") {
    return "Not Available";
  } else {
    return value;
  }
}

String convertDateYYYYMMDDToHumanReadableFormat(String date) {
  if (date == "null" || date.isEmpty) return "";
  var inputFormat = DateFormat('yyyy-MM-dd');
  var dateFormat = inputFormat.parse(date);
  return Jiffy.parse(dateFormat.toString()).format(pattern: 'MMM dd yyyy');
}

Widget loadingWidget({Color? color}) {
  return Center(
    child: CircularProgressIndicator(
      color: color ?? AppColors.blueColor,
    ),
  );
}

Widget noDataFoundWidget({String? text}) {
  return Center(child: Text(text ?? 'No Data found'));
}

Widget errorWidget() {
  return const Center(
    child: Text(' Error Occurred'),
  );
}

double newsDetailsImageAreaSize(BuildContext context) {
  return MediaQuery.of(context).size.height / 3;
}

Map<String, String> getImage(MostPopularNewsModel newItem) {
  Map<String, String> metaData = {};
  List<String> imageSizes = [
    large,
    medium,
    small,
  ];

  for (int i = 0; i < imageSizes.length; i++) {
    metaData.putIfAbsent(
      imageSizes[i].toLowerCase(),
      () {
        String imageUrl = "";
        newItem.media
            ?.forEach((media) => media.mediaMetadata?.forEach((element) {
                  switch (element.height) {
                    case 75:
                      imageUrl = element.url!;

                      break;
                    case 140:
                      imageUrl = element.url!;
                      break;
                    case 293:
                      imageUrl = element.url!;
                      break;
                  }
                }));
        return imageUrl;
      },
    );
  }

  return metaData;
}

getShortName(String fullName) {
  var names = fullName.split(" ");
  String firstName = names[0];
  String lastName = names[1];
  return "$firstName  $lastName";
}
