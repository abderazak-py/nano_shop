import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nano_shop/app/modules/product/models/product_model.dart';
import 'package:nano_shop/app/modules/product/views/widgets/product_actions.dart';
import 'package:nano_shop/app/modules/product/views/widgets/product_details.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProductDetails(product: product),
          Spacer(),
          ProductActions(product: product),
          Spacer(),
        ],
      ),
    );
  }
}
