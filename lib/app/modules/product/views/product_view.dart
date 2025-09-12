import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/controllers/product_controller.dart';
import 'package:nano_shop/app/services/theme_service.dart';

class ProductView extends StatelessWidget {
  final ProductController controller = Get.find<ProductController>();

  ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
            return DropdownButton<String>(
            value: controller.selectedCategory.value,
            alignment: Alignment.center,
            items: controller.categories
              .map((category) => DropdownMenuItem<String>(
                  alignment: AlignmentGeometry.center,
                  value: category,
                  child: Text(category.tr), // Enable translation
                ))
              .toList(),
            onChanged: (value) {
              if (value != null) {
              controller.selectedCategory.value = value;
              controller.fetchProductsByCategory(value);
              }
            },
            underline: SizedBox(),
            icon: Icon(Icons.arrow_drop_down, color: Colors.black87),
            );
        }),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (Get.locale == Locale('en', 'US')) {
                Get.updateLocale(Locale('es', 'ES'));
              } else if (Get.locale == Locale('es', 'ES')) {
                Get.updateLocale(Locale('ar', 'AR'));
              } else {
                Get.updateLocale(Locale('en', 'US'));
              }
            },
            icon: Icon(Icons.language),
          ),

          IconButton(
            onPressed: () {
              ThemeService().switchTheme();
            },
            icon: Icon(Icons.brightness_7_outlined),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text('Error: ${controller.errorMessage}'));
        }
        return ListView.builder(
          itemCount: controller.productList.length,
          itemBuilder: (context, index) {
            final product = controller.productList[index];
            return ListTile(
              title: Column(
                children: [
                  Text(product.title),
                  SizedBox(
                    height: 100,
                    child: Image.network(product.image),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Icon( Icons.star, color: Colors.amber, size: 16),
                  Text(product.rating.toString()),
                  SizedBox(width: 10),
                  Text('(${product.ratingCount.toString()})'),
                  Spacer(),
                  Text('\$${product.price}',
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
          },
        );
      }),
    );
  }
}
