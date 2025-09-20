import 'package:get/get.dart';
import 'package:nano_shop/app/services/language_service.dart';

class LanguageController extends GetxController {
  final LanguageService languageService = Get.find<LanguageService>();

  void changeLanguage(String langCode) {
    languageService.changeLanguage(langCode);
  }

  void loadLanguage() {
    languageService.loadLanguage();
  }
}
