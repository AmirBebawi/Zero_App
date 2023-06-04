import 'package:flutter/material.dart';
import 'package:zero_app/models/product_model.dart';

import '../../shared/components/constant.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = 'ProductDetailsScreen';

  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:  Icon(
            Icons.arrow_back_ios,
            color: defaultColor
,
          ),
        ),
        title:  Text(
          'Product Details',
          style: TextStyle(
            color: defaultColor
,
          ),
        ),
        centerTitle: true,
      ),
      body: ProductItemWidget(
        productModel: args as ProductModel,
      ),
    );
  }
}

class AppbarWidget extends StatelessWidget {
  final VoidCallback searchOnPressed;
  final VoidCallback cartOnPressed;

  const AppbarWidget({
    Key? key,
    required this.searchOnPressed,
    required this.cartOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppbarIconWidget(
          onPressed: searchOnPressed,
          icon: Icons.search_rounded,
        ),
        AppbarIconWidget(
          onPressed: cartOnPressed,
          icon: Icons.shopping_cart,
        ),
      ],
    );
  }
}

class AppbarIconWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const AppbarIconWidget({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class ProductDescriptionWidget extends StatelessWidget {
  final VoidCallback shareOnPressed;
  final VoidCallback favouriteOnPressed;
  final String productDescription;
  final String sellerName;

  const ProductDescriptionWidget({
    Key? key,
    required this.shareOnPressed,
    required this.favouriteOnPressed,
    required this.productDescription,
    required this.sellerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40.0,
        right: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: IconButton(
                  onPressed: shareOnPressed,
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: favouriteOnPressed,
                  icon: const Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
          Text(
            productDescription,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Seller',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              sellerName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
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
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight / 3,
      child: ListView.builder(
        padding: const EdgeInsets.only(
          left: 100,
        ),
        itemCount: productImages.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          height: screenHeight / 3,
          width: screenHeight / 3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                productImages[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductItemWidget extends StatelessWidget {
  final ProductModel productModel;

  const ProductItemWidget({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      // Remove This Container and make scaffold background color to container color
      child: Container(
        color: const Color(0xffA0331A),
        child: Column(
          children: [
            // Top Product Item Container
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(115),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 10.0,
                  bottom: 25.0,
                  top: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProductTitleWidget(
                      productName: productModel.productName,
                      productPrice:'${ productModel.productPrice}',
                    ),
                    ProductImagesWidget(
                      productImages: productModel.productImage,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: const Color(0xffA0331A),
                          width: 2,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xffA0331A),
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Product Description Bottom Widget
            ProductDescriptionWidget(
              shareOnPressed: () {},
              favouriteOnPressed: () {},
              productDescription: productModel.productDecription,
              sellerName: productModel.productSeller,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductTitleWidget extends StatelessWidget {
  final String productName;
  final String productPrice;

  const ProductTitleWidget({
    Key? key,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Name',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          productName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'price',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          productPrice,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}







