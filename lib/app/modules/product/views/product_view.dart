import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/controllers/language_controller.dart';
import 'package:nano_shop/app/modules/product/controllers/product_controller.dart';
import 'package:nano_shop/app/modules/product/controllers/theme_controller.dart';
import 'package:nano_shop/app/modules/product/views/widgets/custom_appbar.dart';
import 'package:nano_shop/app/modules/product/views/widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();
  final ThemeController themeController = Get.find<ThemeController>();
  final LanguageController languageController = Get.find<LanguageController>();

  ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppbar(), body: ProductViewBody());
  }
}
