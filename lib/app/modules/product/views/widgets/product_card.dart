import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/controllers/cart_controller.dart';
import 'package:nano_shop/app/modules/product/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    return GestureDetector(
      onTap: () {
        Get.toNamed('/product-details', arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  color: const Color.fromARGB(26, 158, 158, 158),
                  spreadRadius: 20,
                  offset: Offset(10, 10),
                ),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$'
                          '${product.price.toString()}',
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_shopping_cart_sharp),
                          onPressed: () {
                            cartController.addToCart(product);
                            Get.snackbar(
                              'success'.tr,
                              'product_added_to_cart'.tr,
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: const Color.fromARGB(
                                255,
                                28,
                                218,
                                161,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: -50,
            child: CachedNetworkImage(
              imageUrl: product.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
