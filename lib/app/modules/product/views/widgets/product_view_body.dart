import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/controllers/product_controller.dart';
import 'package:nano_shop/app/modules/product/views/widgets/product_card.dart';

class ProductViewBody extends StatelessWidget {
  ProductViewBody({super.key});

  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (productController.errorMessage.isNotEmpty) {
        return Center(
          child: Text('${'error'.tr}: ${productController.errorMessage}'),
        ); //
      }
      return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child: GridView.builder(
          itemCount: productController.productList.length,
          clipBehavior: Clip.none,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 80,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: productController.productList[index]);
          },
        ),
      );
    });
  }
}
