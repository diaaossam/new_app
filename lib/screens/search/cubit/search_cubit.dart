
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/models/news_model.dart';
import 'package:new_app/screens/search/cubit/search_states.dart';
import 'package:new_app/sharing/constants/constants.dart';
import 'package:new_app/sharing/database/endpoints/end_point.dart';
import 'package:new_app/sharing/database/network/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  NewsModel? newsModel;

  SearchCubit() : super(InitialState());

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  void getSearchData({required String searchText}) {
    emit(OnGetSearchLoading());
    DioHelper().getData(path: search, map: {
      'q': '$searchText',
      'apiKey': API_KEY,
    }).then((value) {
      newsModel = NewsModel.fromJson(value.data);
      emit(OnGetSearchSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(OnGetSearchError(error.toString()));
    });
  }
}
