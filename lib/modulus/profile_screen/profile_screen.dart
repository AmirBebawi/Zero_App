import 'package:flutter/material.dart';
import 'package:zero_app/modulus/edit_profile/edit_profile.dart';
import 'package:zero_app/shared/components/constant.dart';

import '../cart/cart_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              ProfileImageWidget(
                image:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaYWQpFSffuo4yN31aMTqauwbz6vTQaXJypA&usqp=CAU',
                press: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileMenuWidget(
                icon: Icons.person_2_outlined,
                text: 'My Account',
                press: () {
                  Navigator.pushNamed(
                    context,
                    EditProfile.routeName,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileMenuWidget(
                icon: Icons.shopping_cart_outlined,
                text: 'My Cart',
                press: () {
                  Navigator.pushNamed(
                    context,
                    CartScreen.routeName,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileMenuWidget(
                icon: Icons.settings,
                text: 'Settings',
                press: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileMenuWidget(
                icon: Icons.help_outline_outlined,
                text: 'Help Center',
                press: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileMenuWidget(
                icon: Icons.login_outlined,
                text: 'Logout',
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImageWidget extends StatelessWidget {
  final String image;
  final VoidCallback press;

  const ProfileImageWidget({
    Key? key,
    required this.image,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 7,
                    color: Colors.black54.withOpacity(0.1),
                  ),
                ),
              ),
              Positioned(
                height: 46,
                width: 46,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(20)),
                  child: IconButton(
                      onPressed: press,
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                      ),
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  final String text;
  final IconData icon;

  final VoidCallback press;

  const ProfileMenuWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
              EdgeInsets.all(
                15,
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll(Color(0xFFF5F6F9)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
            ),
          ),
          onPressed: press,
          child: Row(
            children: [
              Icon(
                icon,
                color: defaultColor,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: defaultColor,
              )
            ],
          )),
    );
  }
}
