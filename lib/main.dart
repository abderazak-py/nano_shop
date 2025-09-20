import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nano_shop/app/routes/app_pages.dart';
import 'package:nano_shop/app/services/cart_service.dart';
import 'package:nano_shop/app/services/language_service.dart';
import 'package:nano_shop/app/services/theme_service.dart';
import 'package:nano_shop/app/services/translation.dart';

void main() async {
  await GetStorage.init();
  Get.put(LanguageService());
  Get.put(CartService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final languageService = Get.find<LanguageService>();
    final savedLang = languageService.loadLanguage();
    return GetMaterialApp(
      title: 'Nano Shop'.tr,
      translations: AppTranslations(),
      locale: Locale(savedLang!),
      fallbackLocale: const Locale('en'),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeService().theme,
      initialRoute: '/product',
      getPages: AppPages.routes,
    );
  }
}
