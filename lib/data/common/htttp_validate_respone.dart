import 'package:dio/dio.dart';

import '../../common/exception.dart';

mixin HttpValidateRespone {
  validateRespone(Response respone) {
    if (respone.statusCode != 200) {
      throw AppeExeption();
    }
  }
}
