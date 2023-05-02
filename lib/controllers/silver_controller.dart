import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:news/models/my_header_model.dart';

class SliverScrollController extends GetxController {
  RxDouble globalOffsetValue = 0.0.obs;
  RxDouble valueScroll = 0.0.obs;
  RxBool visibleHeader = false.obs;
  RxBool goingDown = false.obs;
  Rx<Header> headerNotifier = Header().obs;

  late ScrollController scrollControllerGlobally;

  @override
  void onInit() {
    scrollControllerGlobally = ScrollController();
    scrollControllerGlobally.addListener(_listenToScrollChange);
    visibleHeader.listen((vlue) {
      listVisibleHeader();
    });
    super.onInit();
  }

  listVisibleHeader() {
    if (visibleHeader.value) {
      headerNotifier.value = Header(index: 0, visible: false);
      return headerNotifier.value;
    }
  }

  void _listenToScrollChange() {
    globalOffsetValue.value = scrollControllerGlobally.offset;
    if (scrollControllerGlobally.position.userScrollDirection ==
        ScrollDirection.reverse) {
      goingDown.value = true;
    } else {
      goingDown.value = false;
    }
  }

  @override
  void dispose() {
    scrollControllerGlobally.dispose();
    super.dispose();
  }
}
