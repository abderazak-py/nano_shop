import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nano_shop/app/modules/product/models/product_model.dart';
import 'package:nano_shop/app/modules/product/views/widgets/product_actions.dart';

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
          Text(
            product.title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: CachedNetworkImage(imageUrl: product.image),
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
          ProductActions(product: product),
          Spacer(),
        ],
      ),
    );
  }
}
