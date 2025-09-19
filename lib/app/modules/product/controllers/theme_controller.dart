import 'package:get/get.dart';
import 'package:nano_shop/app/services/theme_service.dart';

class ThemeController extends GetxController {
  final ThemeService themeService = Get.find<ThemeService>();

  void changeThemeMode() {
    themeService.switchTheme();
    update();
  }

  bool isDarkMode() {
    return themeService.loadThemeFromBox();
  }
}
