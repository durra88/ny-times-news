import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news/bindings/home_binging.dart';
import 'package:news/routes/app_pages.dart';
import 'package:news/views/news_screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

Future<void> initServices() async {
  Binding().dependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NY Times',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialBinding: Binding(),
        initialRoute: RoutesClass.getHomeRoute(),
        getPages: RoutesClass.routes,
        home: const HomePage());
  }
}
