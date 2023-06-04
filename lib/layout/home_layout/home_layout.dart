import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:zero_app/shared/cubit/cubit.dart';
import 'package:zero_app/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'HomeLayout';

  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              currentIndex: cubit.currentIndex,
              selectedItemColor: HexColor('A0331A'),
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                cubit.changeBottomBar(index);
              },
            ),
          );
        },
      ),
    );
  }
}
