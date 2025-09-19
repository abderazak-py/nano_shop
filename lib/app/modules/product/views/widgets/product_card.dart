import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          Text(product.title),
          SizedBox(height: 100, child: Image.network(product.image)),
        ],
      ),
      subtitle: Row(
        children: [
          Icon(Icons.star, color: Colors.amber, size: 16),
          Text(product.rating.toString()),
          SizedBox(width: 10),
          Text('(${product.ratingCount.toString()})'),
          Spacer(),
          Text(
            '\$${product.price}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.green,
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
      onTap: () {
        Get.toNamed('/product-details', arguments: product);
      },
    );
  }
}
