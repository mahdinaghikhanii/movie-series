import 'package:dio/dio.dart';
import 'package:movie_series/common/exception.dart';

mixin HttpValidateRespone {
  validateRespone(Response respone) {
    if (respone.statusCode != 200) {
      throw AppeExeption();
    }
  }
}
