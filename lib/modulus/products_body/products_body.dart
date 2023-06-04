import 'package:flutter/material.dart';
import 'package:zero_app/models/product_model.dart';
import 'package:zero_app/modulus/product_details/product_details_screen.dart';

import '../../shared/components/constant.dart';
import '../cart/cart_body.dart';

class ProductsBody extends StatelessWidget {
  const ProductsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                CartScreen.routeName,
              );
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
            color: defaultColor,
          ),
        ],
      ),
      body: const ProductsWidget(),
    );
  }
}

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
        crossAxisSpacing: 17,
        childAspectRatio: 1 / 1.85,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => DefaultProductItem(
        productModel: products[index],
        viewOnPressed: () {
          Navigator.pushNamed(
            context,
            ProductDetailsScreen.routeName,
            arguments: products[index],
          );
        },
        addToCartOnPressed: () {},
      ),
    );
  }
}

class DefaultProductItem extends StatelessWidget {
  final ProductModel productModel;
  final VoidCallback addToCartOnPressed;
  final VoidCallback viewOnPressed;

  const DefaultProductItem({
    Key? key,
    required this.productModel,
    required this.addToCartOnPressed,
    required this.viewOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red.withOpacity(0.4),
                  child: IconButton(
                    onPressed: addToCartOnPressed,
                    icon: const Icon(
                      Icons.add_shopping_cart_rounded,
                    ),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Image.network(
            productModel.productImage[0],
            fit: BoxFit.fill,
          ),
          Text(
            productModel.productName,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${productModel.productPrice}',
            style: TextStyle(
              color: defaultColor,
              fontSize: 10,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.1),
                  blurRadius: 2,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: TextButton(
              onPressed: viewOnPressed,
              child: Text(
                'View',
                style: TextStyle(
                  color: defaultColor,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
