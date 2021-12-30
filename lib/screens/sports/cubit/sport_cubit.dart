import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/models/news_model.dart';
import 'package:new_app/screens/sports/cubit/sport_states.dart';
import 'package:flutter/material.dart';
import 'package:new_app/sharing/constants/constants.dart';
import 'package:new_app/sharing/database/endpoints/end_point.dart';
import 'package:new_app/sharing/database/network/dio_helper.dart';

class SportCubit extends Cubit<SportStates> {
  NewsModel ? newsModel;
  SportCubit() : super(InitialState());

  static SportCubit get(BuildContext context) => BlocProvider.of(context);

  void getSportsData() {
    emit(OnGetSportLoading());
    DioHelper().getData(path: headLineCategory, map: {
      'country': 'eg',
      'category': 'sport',
      'apiKey': API_KEY,
    }).then((value) {
      newsModel= NewsModel.fromJson(value.data);
      print(newsModel!.articles![0].title);
      emit(OnGetSportSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(OnGetSportError(error.toString()));
    });
  }
}
