import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageService extends GetxService {
  final box = GetStorage();

  Future<void> changeLanguage(String langCode) async {
    Locale locale = Locale(langCode);
    Get.updateLocale(locale);
    await box.write('lang', langCode);
  }

  String? loadLanguage() {
    String? lang = box.read('lang') ?? 'en';
    return lang;
  }
}
