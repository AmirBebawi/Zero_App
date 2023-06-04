import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zero_app/modulus/cart/cart_body.dart';
import 'package:zero_app/modulus/edit_profile/edit_profile.dart';
import 'package:zero_app/modulus/product_details/product_details_screen.dart';
import 'package:zero_app/modulus/register_screen/register_screen.dart';
import 'package:zero_app/shared/bloc_observer/bloc_observer.dart';
import 'package:zero_app/shared/components/constant.dart';
import 'package:zero_app/shared/cubit/cubit.dart';
import 'package:zero_app/shared/cubit/states.dart';
import 'package:zero_app/shared/network/local/cache_helper.dart';
import 'package:zero_app/shared/network/remote/dio_helper.dart';
import 'layout/home_layout/home_layout.dart';
import 'modulus/login_screen/login_screen.dart';
import 'modulus/on_boarding/on_boarding.dart';
import 'modulus/payment_screen/payment_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  if (onBoarding != null) {
    if (token != null) {
      widget = const HomeLayout();
    } else {
      widget = const LoginScreen();
    }
  } else {
    widget = const OnBoarding();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});

  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AppCubit()..calculateTotalPriceOfItems(),
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) => BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Sizer(
              builder: (BuildContext context, Orientation orientation,
                  DeviceType deviceType) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: defaultColor,
                    appBarTheme: const AppBarTheme(
                      iconTheme: IconThemeData(
                        color: Colors.black,
                      ),
                      color: Colors.transparent,
                      elevation: 0.0,
                    ),
                  ),
                  home: startWidget,
                  routes: {
                    OnBoarding.routeName: (context) => const OnBoarding(),
                    LoginScreen.routeName: (context) => const LoginScreen(),
                    RegisterScreen.routeName: (context) =>
                        const RegisterScreen(),
                    HomeLayout.routeName: (context) => const HomeLayout(),
                    ProductDetailsScreen.routeName: (context) =>
                        const ProductDetailsScreen(),
                    CartScreen.routeName: (context) => const CartScreen(),
                    PaymentScreen.routeName: (context) => const PaymentScreen(),
                    EditProfile.routeName: (context) => const EditProfile(),
                  },
                );
              },
            );
          },
        ),
        listener: (context, state) {},
      ),
    );
  }
}
