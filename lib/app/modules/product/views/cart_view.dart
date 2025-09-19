import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/controllers/cart_controller.dart';
import 'package:nano_shop/app/modules/product/views/widgets/cart_card.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(title: Text('cart'.tr), centerTitle: true),
      body: Column(
        children: [
          Obx(() {
            return Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return CartCard(item: item, cartController: cartController);
                },
              ),
            );
          }),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '${'total:'.tr} \$${cartController.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
          ElevatedButton(
            onPressed: () {
              if (cartController.cartItems.isNotEmpty) {
                Get.toNamed('/checkout');
              } else {
                Get.snackbar(
                  'cart_empty'.tr,
                  'Add_items'.tr,
                  snackPosition: SnackPosition.TOP,
                );
              }
            },
            child: Text('proceed_to_checkout'.tr),
          ),
          SizedBox(height: 35),
        ],
      ),
    );
  }
}
