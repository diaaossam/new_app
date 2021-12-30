import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/app_cubit/app_cubit.dart';
import 'package:new_app/app_cubit/app_state.dart';
import 'package:new_app/sharing/style/size_config.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        bool mode = HomeLayoutCubit.get(context).isDark;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  children: [
                    Text(
                      'Day Mode',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Spacer(),
                    Container(
                      width: SizeConfig.screenWidth * 0.3,
                      height: SizeConfig.screenWidth * 0.17,
                      child: DayNightSwitcher(
                          isDarkModeEnabled: mode,
                          onStateChanged: (bool state) {
                            HomeLayoutCubit.get(context).changeAppTheme();
                          }),
                    ),
                    Spacer(),
                    Text(
                      'Night Mode',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
