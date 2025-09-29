import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/models/product_model.dart';
import 'package:nano_shop/app/modules/product/views/widgets/product_details_body.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;

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
      body: ProductDetailsBody(product: product),
    );
  }
}
