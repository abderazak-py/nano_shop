import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/controllers/product_controller.dart';
import 'package:nano_shop/app/modules/product/controllers/theme_controller.dart';
import 'package:nano_shop/app/modules/product/views/widgets/product_card.dart';

class ProductView extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();
  final ThemeController themeController = Get.find<ThemeController>();

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
          GetBuilder<ThemeController>(
            builder: (_) {
              return PopupMenuButton<String>(
                tooltip: 'language'.tr,
                icon: Icon(Icons.language),
                onSelected: (String value) {
                  switch (value) {
                    case 'ar':
                      Get.updateLocale(Locale('ar', 'AR'));
                      break;
                    case 'zh':
                      Get.updateLocale(Locale('zh', 'CN'));
                      break;
                    case 'en':
                      Get.updateLocale(Locale('en', 'US'));
                      break;
                    case 'fr':
                      Get.updateLocale(Locale('fr', 'FR'));
                      break;
                    case 'de':
                      Get.updateLocale(Locale('de', 'DE'));
                      break;
                    case 'hi':
                      Get.updateLocale(Locale('hi', 'IN'));
                      break;
                    case 'ja':
                      Get.updateLocale(Locale('ja', 'JP'));
                      break;
                    case 'pt':
                      Get.updateLocale(Locale('pt', 'PT'));
                      break;
                    case 'es':
                      Get.updateLocale(Locale('es', 'ES'));
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(value: 'ar', child: Text('arabic')),
                  PopupMenuItem<String>(value: 'en', child: Text('english')),
                  PopupMenuItem<String>(value: 'zh', child: Text('chinese')),
                  PopupMenuItem<String>(value: 'fr', child: Text('french')),
                  PopupMenuItem<String>(value: 'de', child: Text('german')),
                  PopupMenuItem<String>(value: 'hi', child: Text('hindi')),
                  PopupMenuItem<String>(value: 'ja', child: Text('japanese')),
                  PopupMenuItem<String>(value: 'pt', child: Text('portuguese')),
                  PopupMenuItem<String>(value: 'es', child: Text('spanish')),
                ],
              );
            },
          ),
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
