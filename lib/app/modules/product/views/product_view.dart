import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/controllers/language_controller.dart';
import 'package:nano_shop/app/modules/product/controllers/product_controller.dart';
import 'package:nano_shop/app/modules/product/controllers/theme_controller.dart';
import 'package:nano_shop/app/modules/product/views/widgets/language_menu.dart';
import 'package:nano_shop/app/modules/product/views/widgets/product_card.dart';

class ProductView extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();
  final ThemeController themeController = Get.find<ThemeController>();
  final LanguageController languageController = Get.find<LanguageController>();

  ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (productController.errorMessage.isNotEmpty) {
          return Center(
            child: Text('${'error'.tr}: ${productController.errorMessage}'),
          ); //
        }
        return ListView.builder(
          itemCount: productController.productList.length,
          itemBuilder: (context, index) {
            final product = productController.productList[index];
            return ProductCard(product: product);
          },
        );
      }),
    );
  }
}
