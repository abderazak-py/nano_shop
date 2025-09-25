import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

  List<String> categories = [
    'all',
    'electronics',
    'jewel',
    'men\'s clothing',
    'women\'s clothing',
  ];

  var selectedCategory = 'all'.obs;
  void fetchProductsByCategory(String category) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // Define cache key based on category
      String cacheKey = category == 'all'
          ? 'all_products'
          : 'products_$category';

      List<ProductModel> fetchedProducts;
      if (category == 'all') {
        fetchedProducts = await productService.fetchProducts();
      } else {
        fetchedProducts = await productService.fetchProductsByCategory(
          category,
        );
      }

      // Store data in GetStorage for offline access
      List<Map<String, dynamic>> jsonList = fetchedProducts
          .map((product) => product.toJson())
          .toList();
      await GetStorage().write(cacheKey, jsonList);

      productList.value = fetchedProducts;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching products by category: $e');
      }

      // If network fails and we have cached data, continue using it
      String cacheKey = category == 'all'
          ? 'all_products'
          : 'products_$category';
      List<dynamic>? cachedData = GetStorage().read(cacheKey);

      if (cachedData != null && cachedData.isNotEmpty) {
        try {
          productList.value = cachedData
              .map(
                (json) =>
                    ProductModel.fromJson(Map<String, dynamic>.from(json)),
              )
              .toList();
        } catch (cacheError) {
          if (kDebugMode) {
            print('Cache parsing error: $cacheError');
          }
          errorMessage.value = 'failed_to_load'.tr;
        }
      } else {
        errorMessage.value = 'failed_to_load'.tr;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
