import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/modules/home_layout.dart';
import 'package:new_app/app_cubit/app_cubit.dart';
import 'package:new_app/screens/business/cubit/business_cubit.dart';
import 'package:new_app/screens/health/cubit/health_cubit.dart';
import 'package:new_app/screens/science/cubit/science_cubit.dart';
import 'package:new_app/screens/search/cubit/search_cubit.dart';
import 'package:new_app/screens/sports/cubit/sport_cubit.dart';
import 'package:new_app/screens/tech/cubit/tech_cubit.dart';
import 'package:new_app/sharing/constants/constants.dart';
import 'package:new_app/sharing/database/local/cache_helper.dart';
import 'package:new_app/sharing/database/network/dio_helper.dart';
import 'package:new_app/sharing/style/styles.dart';

import 'app_cubit/bloc_observer.dart';
import 'app_cubit/app_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();

  bool? appTheme = CacheHelper.getData(key: DARK_MODE);

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(appTheme ?? false));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  bool appMode;

  MyApp(this.appMode);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BusinessCubit()..getBusinessData(),
        ),
        BlocProvider(
          create: (context) =>
              HomeLayoutCubit()..changeAppTheme(fromShared: appMode),
        ),
        BlocProvider(create: (context) => SportCubit()),
        BlocProvider(create: (context) => TechCubit()),
        BlocProvider(create: (context) => ScienceCubit()),
        BlocProvider(create: (context) => HealthCubit()),
        BlocProvider(create: (context) => SearchCubit()),
      ],
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeLayoutCubit cubit = HomeLayoutCubit.get(context);
          return MaterialApp(
              home: HomeLayout(),
              debugShowCheckedModeBanner: false,
              darkTheme: darkTheme,
              theme: lightTheme,
              themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light);
        },
      ),
    );
  }
}
