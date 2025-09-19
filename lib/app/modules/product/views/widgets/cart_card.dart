import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/controllers/cart_controller.dart';
import 'package:nano_shop/app/modules/product/models/product_model.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.item, required this.cartController});

  final ProductModel item;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: const Icon(Icons.remove_circle),
        onPressed: () {
          Get.defaultDialog(
            title: 'remove_from_cart'.tr,
            middleText: 'remove_from_cart_confirm'.tr,
            textCancel: 'no'.tr,
            textConfirm: 'yes'.tr,
            onConfirm: () {
              cartController.removeFromCart(item);
              Get.back();
            },
            onCancel: () {
              Get.back();
            },
          );
        },
      ),
    );
  }
}
