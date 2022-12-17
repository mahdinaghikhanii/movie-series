import 'package:dio/dio.dart';

import 'app_constans.dart';

final httpClint = Dio(BaseOptions(
  baseUrl: AppConstans.baseUrl,
));
