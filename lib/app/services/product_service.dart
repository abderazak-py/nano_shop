import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nano_shop/app/modules/product/models/product_model.dart';

class ProductService {
  final String apiUrl = "https://fakestoreapi.com/products";
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products from API');
    }
  }
Future<List<ProductModel>> fetchProductsByCategory(String category) async {
    final response = await http.get(Uri.parse('$apiUrl/category/$category'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products from API');
    }
  }

}