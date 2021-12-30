
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/models/news_model.dart';
import 'package:new_app/screens/science/cubit/science_states.dart';
import 'package:flutter/material.dart';
import 'package:new_app/sharing/constants/constants.dart';
import 'package:new_app/sharing/database/endpoints/end_point.dart';
import 'package:new_app/sharing/database/network/dio_helper.dart';

class ScienceCubit extends Cubit<ScienceStates> {
  NewsModel ? newsModel;
  ScienceCubit() : super(InitialState());

  static ScienceCubit get(BuildContext context) => BlocProvider.of(context);

  void getScienceData() {
    emit(OnGetScienceLoading());
    DioHelper().getData(path: headLineCategory, map: {
      'country': 'eg',
      'category': 'science',
      'apiKey': API_KEY,
    }).then((value) {
      newsModel= NewsModel.fromJson(value.data);

      emit(OnGetScienceSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(OnGetScienceError(error.toString()));
    });
  }
}
