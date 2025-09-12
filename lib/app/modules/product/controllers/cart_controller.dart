import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/models/product_model.dart';
import 'package:nano_shop/app/services/cart_service.dart';

class CartController extends GetxController {
final CartService cartService = Get.find<CartService>();

List<ProductModel> get cartItems => cartService.cartItems;

double get totalPrice => cartService.totalPrice;

void addToCart(ProductModel product) {
  cartService.addToCart(product);
  update(); // Notify listeners to update UI
  }
void removeFromCart(ProductModel product) {
  cartService.removeFromCart(product);
  update(); // Notify listeners to update UI
  }

  void clearCart() {
    cartService.cartItems.clear();
    cartService.saveCart();
    update(); // Notify listeners to update UI
  }

}
