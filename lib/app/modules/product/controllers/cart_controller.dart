import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/models/product_model.dart';
import 'package:nano_shop/app/services/cart_service.dart';

class CartController extends GetxController {
  final CartService cartService = Get.find<CartService>();

  List<ProductModel> get cartItems => cartService.cartItems;

  double get totalPrice => cartService.totalPrice;

  void addToCart(ProductModel product) {
    cartService.addToCart(product);
    update();
  }

  void removeFromCart(ProductModel product) {
    cartService.removeFromCart(product);
    update();
  }

  void clearCart() {
    cartService.cartItems.clear();
    cartService.saveCart();
    update();
  }
}
