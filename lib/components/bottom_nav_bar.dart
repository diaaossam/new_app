import 'package:flutter/material.dart';
import 'package:new_app/app_cubit/app_cubit.dart';

class BottomNavBar extends StatelessWidget {
  HomeLayoutCubit cubit;

  BottomNavBar(this.cubit);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: cubit.bottomNavList,
      onTap: (index) {
        cubit.changeBottomNavIndex(context,index);
      },
      currentIndex: cubit.currentIndex,

    );
  }
}
