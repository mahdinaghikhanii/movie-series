import 'package:dio/dio.dart';
import 'package:movie_series/common/app_constans.dart';

final httpClint = Dio(BaseOptions(
  baseUrl: AppConstans.baseUrl,
));
