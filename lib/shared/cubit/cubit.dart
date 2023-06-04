import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_app/models/cart_model.dart';
import 'package:zero_app/modulus/categories/categories_body.dart';
import 'package:zero_app/modulus/search/search_body.dart';
import 'package:zero_app/shared/cubit/states.dart';

import '../../modulus/products_body/products_body.dart';
import '../../modulus/profile_screen/profile_screen.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.factory_outlined,
      ),
      label: 'Products',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.category_outlined,
      ),
      label: 'Categories',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.search_rounded,
      ),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
      ),
      label: 'Profile',
    ),
  ];
  List<Widget> screen = const [
    ProductsBody(),
    CategoriesBody(),
    SearchBody(),
    ProfileScreen(),
  ];

  void changeBottomBar(int index) {
    currentIndex = index;
    emit(
      ChangeButtonNavState(),
    );
  }
  Future<void> removeFromCart(int index)
  async{
    cartItems.removeAt(index);
  }
  int totalPrice = 0 ;
  void calculateTotalPriceOfItems(){
    for(int i = 0 ; i<cartItems.length ; i++ )
      {
        totalPrice =totalPrice + cartItems[i].product.productPrice ;
      }
    emit(CalculateTotalPriceOfItem());
  }
}
