import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/models/news_model.dart';
import 'package:new_app/screens/business/cubit/business_states.dart';
import 'package:new_app/sharing/constants/constants.dart';
import 'package:new_app/sharing/database/endpoints/end_point.dart';
import 'package:new_app/sharing/database/network/dio_helper.dart';

class BusinessCubit extends Cubit<BusinessStates> {
   NewsModel ? newsModel;

  BusinessCubit() : super(InitialStates());

  static BusinessCubit get(BuildContext context) => BlocProvider.of(context);

  void getBusinessData() {
    emit(OnGetBusinessLoading());
    DioHelper().getData(path: headLineCategory, map: {
      'country': 'eg',
      'category': 'business',
      'apiKey': API_KEY,
    }).then((value) {
      newsModel = NewsModel.fromJson(value.data);

      emit(OnGetBusinessSuccess());
    }).catchError((error) {
      emit(OnGetBusinessError(error.toString()));
    });
  }
}
