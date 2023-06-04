import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zero_app/modulus/payment_screen/payment_screen.dart';
import 'package:zero_app/shared/components/constant.dart';
import 'package:zero_app/shared/cubit/cubit.dart';
import 'package:zero_app/shared/cubit/states.dart';

import '../../models/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = 'cartScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              'Your cart',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Text(
              "${cartItems.length} items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // if(state is LoginSuccessState)
          //   {
          //     AppCubit.get(context).calculateTotalPriceOfItems();
          //   }
        },
        builder: (context, state) {
          return Scaffold(
            body: const Body(),
            bottomNavigationBar: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total:',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${AppCubit.get(context).totalPrice}',
                          style: TextStyle(color: defaultColor, fontSize: 15),
                        ),
                      ],
                    ),
                    Container(
                      width: 200,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            PaymentScreen.routeName,
                          );
                        },
                        color: defaultColor,
                        height: 50,
                        child: const Text('Check Out',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => ListView.separated(
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) async {
            await cubit.removeFromCart(index);
          },
          direction: DismissDirection.endToStart,
          key: Key(cartItems[index].product.id.toString()),
          background: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(color: Color(0x0ffffe6e)),
            child: Row(children: [
              const Spacer(),
              SvgPicture.asset("assets/Trash/Trash.svg"),
            ]),
          ),
          child: CartItemWidget(
            cart: cartItems[index],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: cartItems.length,
      ),
    );
  }
}

class ProductImagesWidget extends StatelessWidget {
  final List<String> productImages;

  const ProductImagesWidget({
    Key? key,
    required this.productImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: ListView.builder(
        itemCount: productImages.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                productImages[index],
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key, required this.cart}) : super(key: key);
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),
      height: 100,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsetsDirectional.only(start: 20, top: 10, end: 1),
            child:
                ProductImagesWidget(productImages: cart.product.productImage),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.productName,
                style: TextStyle(
                  fontSize: 16,
                  color: defaultColor,
                ),
                maxLines: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '${cart.product.productPrice}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text('  x ${cart.numOfItem}',
                      style: TextStyle(fontSize: 9, color: defaultColor)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
