import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/models/news_model.dart';
import 'package:new_app/screens/health/cubit/health_states.dart';
import 'package:flutter/material.dart';
import 'package:new_app/sharing/constants/constants.dart';
import 'package:new_app/sharing/database/endpoints/end_point.dart';
import 'package:new_app/sharing/database/network/dio_helper.dart';

class HealthCubit extends Cubit<HealthStates> {
  NewsModel? newsModel;

  HealthCubit() : super(InitialState());

  static HealthCubit get(BuildContext context) => BlocProvider.of(context);

  void getHealthData() {
    emit(OnGetHealthLoading());
    DioHelper().getData(path: headLineCategory, map: {
      'country': 'eg',
      'category': 'health',
      'apiKey': API_KEY,
    }).then((value) {
      newsModel = NewsModel.fromJson(value.data);

      emit(OnGetHealthSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(OnGetHealthError(error.toString()));
    });
  }
}
