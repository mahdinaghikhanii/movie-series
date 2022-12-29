import 'package:dio/dio.dart';
import '../../common/app_constans.dart';
import '../entity/information_movie.dart';

import '../common/htttp_validate_respone.dart';

abstract class IInformationMovieDataSourec {
  Future<InformationMovieEntity> getInformationMovie({required String idMovie});
}

class InformationMovieDataSourec
    with HttpValidateRespone
    implements IInformationMovieDataSourec {
  final Dio httpClient;
  InformationMovieDataSourec(this.httpClient);
  @override
  Future<InformationMovieEntity> getInformationMovie(
      {required String idMovie}) async {
    Response response = await httpClient
        .get(AppConstans.baseUrlForMovie + idMovie + AppConstans.apiKey);
    validateRespone(response);
    return InformationMovieEntity.fromJson(response.data);
  }
}
