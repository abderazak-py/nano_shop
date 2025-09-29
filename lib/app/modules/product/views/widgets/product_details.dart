import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:nano_shop/app/modules/product/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 10,
          product.description,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ],
    );
  }
}
