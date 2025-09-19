import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:nano_shop/app/modules/product/controllers/product_controller.dart';
import 'package:nano_shop/app/modules/product/controllers/theme_controller.dart';
import 'package:nano_shop/app/services/product_service.dart';
import 'package:nano_shop/app/services/theme_service.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductService>(() => ProductService());
    Get.lazyPut<ThemeService>(() => ThemeService());
    Get.lazyPut<ProductController>(
      () => ProductController(productService: Get.find<ProductService>()),
    );
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}
