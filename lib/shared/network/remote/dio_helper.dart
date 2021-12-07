import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          // baseUrl:'https://newsapi.org/',  old
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          ),
    );
  }

  static Future<Response> getData({
    required String url,
     Map<String, dynamic>? query,
    String lang = 'en',
     String? token,
  }) async {
    dio.options.headers =
    {
      'lang' : lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json'  ,


    };
    return await dio.get(
      url,
      queryParameters: query ,
    );
  }
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
     Map<String, dynamic>? query,
    String lang = 'en',
     String? token ,
  }) async {
    dio.options.headers =
    {
      'lang': lang ,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',


    };
    return dio.post(
      url,
      queryParameters: query,
      data : data,

    );

  }

 static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token ,
  }) async {
    dio.options.headers =
    {
      'lang': lang ,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',


    };
    return dio.put(
      url,
      queryParameters: query,
      data : data,

    );

  }





}

/// buseurl : https://newsapi.org/
/// url : v2/top-headlines?
/// query : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
///
/// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
///
///
/// search
///
///  https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca
