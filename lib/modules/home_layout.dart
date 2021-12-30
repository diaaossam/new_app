import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/components/bottom_nav_bar.dart';
import 'package:new_app/app_cubit/app_cubit.dart';
import 'package:new_app/app_cubit/app_state.dart';
import 'package:new_app/screens/search/search_screen.dart';
import 'package:new_app/screens/settings/settings_screen.dart';
import 'package:new_app/sharing/constants/constants.dart';
import 'package:new_app/sharing/database/endpoints/end_point.dart';
import 'package:new_app/sharing/style/size_config.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeLayoutCubit cubit = HomeLayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.title[cubit.currentIndex]),
            centerTitle: true,
            actions: [

              IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search)),

              IconButton(
                  onPressed: () {
                    navigateTo(context, SettingsScreen());
                  },
                  icon: Icon(Icons.settings)),
            ],
          ),
          bottomNavigationBar: BottomNavBar(cubit),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
