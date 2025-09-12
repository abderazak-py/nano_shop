import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nano_shop/app/routes/app_pages.dart';
import 'package:nano_shop/app/services/cart_service.dart';
import 'package:nano_shop/app/services/theme_service.dart';
import 'package:nano_shop/app/services/translation.dart';

void main() async {
  await GetStorage.init();
  Get.put(CartService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'app_title'.tr,
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeService().theme,
      initialRoute: '/product',
      getPages: AppPages.routes,
    );
}}
