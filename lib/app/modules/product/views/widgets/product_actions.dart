import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/controllers/cart_controller.dart';
import 'package:nano_shop/app/modules/product/models/product_model.dart';

class ProductActions extends StatelessWidget {
  ProductActions({super.key, required this.product});

  final CartController cartController = Get.find<CartController>();
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        ElevatedButton(
          onPressed: () {
            cartController.addToCart(product);
            Get.snackbar(
              'success'.tr,
              'product_added_to_cart'.tr,
              snackPosition: SnackPosition.TOP,
              backgroundColor: const Color.fromARGB(255, 28, 218, 161),
            );
          },
          child: Text('add_to_cart'.tr),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                color: Colors.white,
                child: Wrap(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.info),
                      title: Text('add_to_cart'.tr),
                      onTap: () {
                        cartController.addToCart(product);
                        Get.back();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.info),
                      title: Text('proceed_to_checkout'.tr),
                      onTap: () {
                        cartController.addToCart(product);
                        Get.toNamed('/checkout');
                      },
                    ),
                  ],
                ),
              ),
            );
          },
          child: Text('more_options'.tr),
        ),
        Spacer(),
      ],
    );
  }
}
