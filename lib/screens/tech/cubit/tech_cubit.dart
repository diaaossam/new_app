
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/models/news_model.dart';
import 'package:new_app/screens/tech/cubit/tech_states.dart';
import 'package:flutter/material.dart';
import 'package:new_app/sharing/constants/constants.dart';
import 'package:new_app/sharing/database/endpoints/end_point.dart';
import 'package:new_app/sharing/database/network/dio_helper.dart';

class TechCubit extends Cubit<TechStates> {
  NewsModel ? newsModel;
  TechCubit() : super(InitialState());

  static TechCubit get(BuildContext context) => BlocProvider.of(context);

  void getTechData() {
    emit(OnGetTechSuccess());
    DioHelper().getData(path: headLineCategory, map: {
      'country': 'eg',
      'category': 'technology',
      'apiKey': API_KEY,
    }).then((value) {
      newsModel= NewsModel.fromJson(value.data);
      print(newsModel!.articles![0].title);
      emit(OnGetTechSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(OnGetTechError(error.toString()));
    });
  }
}
