import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/controllers/cart_controller.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: Column(
        children:[
          SizedBox(height: 50),
          Align(
            alignment: Alignment.center,
            child: Text( 'Thank you for purchase!', style: Theme.of(context).textTheme.headlineMedium,),
          ),
            
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
              final CartController cartController = Get.find<CartController>();
              cartController.clearCart();
              Get.snackbar('success'.tr, 'order_placed_successfully'.tr,
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: const Color.fromARGB(255, 4, 238, 121),
                  duration: const Duration(seconds: 2),
                  );

            Get.offAllNamed('/product');
          },
          child: const Text('Place Order'),
        )  
      ],)
    );
  }
}