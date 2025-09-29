import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/controllers/language_controller.dart';
import 'package:nano_shop/app/modules/product/controllers/product_controller.dart';
import 'package:nano_shop/app/modules/product/controllers/theme_controller.dart';
import 'package:nano_shop/app/modules/product/views/widgets/language_menu.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({super.key});

  final ProductController productController = Get.find<ProductController>();
  final ThemeController themeController = Get.find<ThemeController>();
  final LanguageController languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Obx(() {
        return DropdownButton<String>(
          value: productController.selectedCategory.value,
          alignment: Alignment.center,
          items: productController.categories
              .map(
                (category) => DropdownMenuItem<String>(
                  alignment: AlignmentGeometry.center,
                  value: category,
                  child: Text(category.tr),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              productController.selectedCategory.value = value;
              productController.fetchProductsByCategory(value);
            }
          },
          underline: SizedBox(),
          icon: Icon(Icons.arrow_drop_down, color: Colors.black87),
        );
      }),
      centerTitle: true,
      actions: [
        LanguageMenu(languageController: languageController),
        GetBuilder<ThemeController>(
          builder: (_) {
            return IconButton(
              onPressed: () {
                themeController.changeThemeMode();
              },
              icon: themeController.isDarkMode()
                  ? Icon(Icons.light_mode)
                  : Icon(Icons.dark_mode),
            );
          },
        ),
      ],
      leading: IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () {
          Get.toNamed('/cart');
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
