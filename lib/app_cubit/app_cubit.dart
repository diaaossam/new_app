import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/app_cubit/app_state.dart';
import 'package:new_app/screens/business/business_screen.dart';
import 'package:new_app/screens/health/cubit/health_cubit.dart';
import 'package:new_app/screens/health/health_screen.dart';
import 'package:new_app/screens/science/cubit/science_cubit.dart';
import 'package:new_app/screens/science/science_screen.dart';
import 'package:new_app/screens/sports/cubit/sport_cubit.dart';
import 'package:new_app/screens/sports/sport_screen.dart';
import 'package:new_app/screens/tech/cubit/tech_cubit.dart';
import 'package:new_app/screens/tech/tecnology_screen.dart';
import 'package:new_app/sharing/constants/constants.dart';
import 'package:new_app/sharing/database/local/cache_helper.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  int currentIndex = 0;

  HomeLayoutCubit() : super(InitialState());

  List<String> title = [
    'Business',
    'Sports',
    'Technology',
    'Science',
    'Health',
  ];

  List<BottomNavigationBarItem> bottomNavList = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_sharp),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_basketball_outlined),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.computer),
      label: 'Technology',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.health_and_safety_outlined),
      label: 'Health',
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    TechnologyScreen(),
    ScienceScreen(),
    HealthScreen(),
  ];

  static HomeLayoutCubit get(BuildContext context) => BlocProvider.of(context);

  void changeBottomNavIndex(BuildContext context, int index) {
    currentIndex = index;
    if (index == 1)
      SportCubit.get(context)..getSportsData();
    else if (index == 2)
      TechCubit.get(context).getTechData();
    else if (index == 3)
      ScienceCubit.get(context).getScienceData();
    else if (index == 4) HealthCubit.get(context).getHealthData();
    emit(ChangeBottomNavIndex());
  }

  bool isDark = false;

  void changeAppTheme({bool? fromShared}) {
    if (fromShared != null)
      isDark = fromShared;
    else
      isDark = !isDark;
    CacheHelper.putData(key: DARK_MODE, date: isDark)
        .then((value) {
          emit(ChangeAppThemeState());
    })
        .catchError((error) {
      print(error.toString());
    });
  }
}
