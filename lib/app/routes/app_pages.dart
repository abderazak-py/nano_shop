import 'package:get/get.dart';
import 'package:nano_shop/app/binding/product_binding.dart';
import 'package:nano_shop/app/modules/product/views/cart_view.dart';
import 'package:nano_shop/app/modules/product/views/checkout_view.dart';
import 'package:nano_shop/app/modules/product/views/product_detail_view.dart';
import 'package:nano_shop/app/modules/product/views/product_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.product,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(name: Routes.productDetails, page: () => ProductDetailView()),
    GetPage(name: Routes.cart, page: () => CartView()),
    GetPage(name: Routes.checkout, page: () => CheckoutView()),
    // Define your app routes here
  ];
}
