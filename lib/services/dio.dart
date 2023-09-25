import 'package:dio/dio.dart';

Dio dio () {
  Dio dio = new Dio();

  // ios
  // dio.options.baseUrl = "http://localhost:8000/api";
  // linux
  // dio.options.baseUrl = 'http://localhost:8000/api';
  // android
  dio.options.baseUrl = 'http://10.0.2.2:8000/api/sellers';


  //dio.options.connectTimeout = 5000; //5s
  //dio.options.receiveTimeout = 3000;

  dio.options.headers['Accept'] = '*/*';
  dio.options.headers['Accept'] = 'Application/Json';
  dio.options.headers['Accept'] = 'Application/pdf';

  return dio;
}