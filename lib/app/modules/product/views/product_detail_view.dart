import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/controllers/cart_controller.dart';
import 'package:nano_shop/app/modules/product/models/product_model.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed('/cart');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              product.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.network(product.image),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 22),
                Text(
                  '${product.rating}(${product.ratingCount.toString()})',
                  style: TextStyle(fontSize: 22),
                ),
                Spacer(),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: SingleChildScrollView(
                child: Text(
                  product.description,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
            ),
            Spacer(),
            Row(
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
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
