import 'package:flutter/material.dart';

import '../../shared/components/constant.dart';
import '../cart/cart_body.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({Key? key}) : super(key: key);

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
      body: ListView.separated(
          itemBuilder: (context, index) => const DefaultCategoriesItem(),
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: 4),
    );
  }
}

class DefaultCategoriesItem extends StatelessWidget {
  const DefaultCategoriesItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: defaultColor,
          borderRadius: const BorderRadiusDirectional.all(
            Radius.circular(
              30,
            ),
          ),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Image(
                image: AssetImage(
                  "assets/on_boarding/p1.png",
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              'BMW',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 110,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                color: defaultColor,
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
