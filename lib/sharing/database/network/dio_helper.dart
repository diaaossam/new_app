import 'package:dio/dio.dart';
import 'package:new_app/sharing/constants/constants.dart';

class DioHelper{
  static Dio? _dio;

  static init(){
    BaseOptions baseOptions = BaseOptions(
      baseUrl:BASE_URL,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    _dio = Dio(baseOptions);
  }

  Future<Response> getData({
    required path , required Map<String ,
        dynamic> map})async{
    return await _dio!.get(path,queryParameters: map);
  }
}