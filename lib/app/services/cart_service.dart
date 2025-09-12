import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nano_shop/app/modules/product/models/product_model.dart';

class CartService extends GetxService{
  final storage = GetStorage();
  var cartItems = <ProductModel>[].obs;
@override
  void onInit() {
    super.onInit();
    List? storedItems = storage.read<List>('cartItems');
    if (storedItems != null) {
      cartItems = storedItems.map((item) => ProductModel.fromJson(item)).toList().obs;
    }
  }

  void addToCart(ProductModel product) {
    cartItems.add(product);
    saveCart();
  }

  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
    saveCart();
  }

  void saveCart() {
    storage.write('cartItems', cartItems.map((item) => item.toJson()).toList());
  }

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);



}

