import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/models/product_model.dart';
import 'package:nano_shop/app/services/product_service.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final ProductService productService;

  ProductController({required this.productService});

  @override
  void onInit() {
    super.onInit();
    fetchProductsByCategory(selectedCategory.value);
  }
  List<String> categories = ['all', 'electronics', 'jewel', 'men\'s clothing', 'women\'s clothing'];

  var selectedCategory = 'all'.obs;
  void fetchProductsByCategory(String category) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      List<ProductModel> fetchedProducts;
      if (category == 'all') {
        fetchedProducts = await productService.fetchProducts();
      } else {
        fetchedProducts = await productService.fetchProductsByCategory(category);
      }
      productList.value = fetchedProducts;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching products by category: $e');
      }
      errorMessage.value = 'Failed to load products. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

}