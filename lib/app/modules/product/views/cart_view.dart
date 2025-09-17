import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/controllers/cart_controller.dart';

class CartView extends StatelessWidget{
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(() {
            return Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {

                        Get.defaultDialog(
                          title: 'Remove Item',
                          middleText: 'Are you sure you want to remove this item from the cart?',
                          textCancel: 'No',
                          textConfirm: 'Yes',
                          onConfirm: () {
                            cartController.removeFromCart(item);
                            Get.back(); // Close the dialog
                          },
                          onCancel: () {
                            Get.back(); // Close the dialog
                          },
                        );

                        
                      },
                    ),
                  );
                },
              ),
            );
          }),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: \$${cartController.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          }),
          ElevatedButton(
            onPressed: () {
              if (cartController.cartItems.isNotEmpty) {
                Get.toNamed('/checkout');
              } else {
                Get.snackbar('Cart is empty', 'Add items to cart before checkout',
                    snackPosition: SnackPosition.TOP);
              }
            },
            child: const Text('Proceed to Checkout'),
          ),
          SizedBox(height: 35),
        ],
      )
    );
  }
}
