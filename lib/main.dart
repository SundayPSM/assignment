import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:morphos_assignment/app/modules/network/bindings/network_binding.dart';
import 'package:morphos_assignment/app/modules/themes/themes.dart';

import 'package:get_storage/get_storage.dart';
import 'app/modules/home/models/product_colors_model.dart';
import 'app/modules/home/models/product_model.dart';
import 'app/routes/app_pages.dart';

late Box productsHive;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(ProductColorsAdapter());

  await Hive.openBox<Product>('productsHive');

  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      initialBinding: NetworkBinding(),
      getPages: AppPages.routes,
      theme: Themes().lightThemeData,
    ),
  );
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
