import 'package:dio/dio.dart';
import '../../common/htttp_validate_respone.dart';
import '../../entity/cast_movie.dart';

abstract class ICastMovieDataSource {
  Future<CastMovieEntity> getCastMvoie({required String idMovie});
}

class CastMovieDataSource
    with HttpValidateRespone
    implements ICastMovieDataSource {
  final Dio httpClient;
  CastMovieDataSource(this.httpClient);

  @override
  Future<CastMovieEntity> getCastMvoie({required String idMovie}) async {
    Response responses = await httpClient.get(
        "movie/$idMovie/credits?api_key=caeeae4ccb1c5ddacd05161e7217a2e6&language=en-US");
    validateRespone(responses);
    return CastMovieEntity.fromJson(responses.data);
  }
}
