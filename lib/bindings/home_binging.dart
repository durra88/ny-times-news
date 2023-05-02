import 'package:get/get.dart';
import 'package:news/controllers/connectivity_controller.dart';
import 'package:news/controllers/home_controller.dart';
import 'package:news/controllers/silver_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectivityController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SliverScrollController());
  }
}
