import 'package:zero_app/models/product_model.dart';

class Cart {
  final ProductModel product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Cart> cartItems = [
  Cart(product: products[0], numOfItem: 2),
  Cart(product: products[1], numOfItem: 1),
  Cart(product: products[2], numOfItem: 1),
  Cart(product: products[3], numOfItem: 2),
  Cart(product: products[4], numOfItem: 1),
  Cart(product: products[5], numOfItem: 1),
];
