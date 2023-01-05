import 'package:dio/dio.dart';

import '../../../common/app_constans.dart';
import '../../common/htttp_validate_respone.dart';
import '../../entity/movie_item.dart';

abstract class IMovieDataSource {
  Future<MovieItemEntity> getNowPlaying();
  Future<MovieItemEntity> getUpCominf();
  Future<MovieItemEntity> getTopRated({required int page});
  Future<MovieItemEntity> getTopRatedTabBar({required int page});
  Future<MovieItemEntity> getPopular();
}

class MovieDataSource with HttpValidateRespone implements IMovieDataSource {
  final Dio httpClient;
  MovieDataSource(this.httpClient);
  @override
  Future<MovieItemEntity> getNowPlaying() async {
    final respone = await httpClient.get(AppConstans.baseUrlForMovie +
        AppConstans.nowPlaying +
        AppConstans.apiKey);
    validateRespone(respone);
    return MovieItemEntity.fromJson(respone.data);
  }

  @override
  Future<MovieItemEntity> getUpCominf() async {
    final respone = await httpClient.get(AppConstans.baseUrlForMovie +
        AppConstans.upcoming +
        AppConstans.apiKey);
    validateRespone(respone);
    return MovieItemEntity.fromJson(respone.data);
  }

  @override
  Future<MovieItemEntity> getTopRated({required int page}) async {
    final respone = await httpClient.get(
        "${AppConstans.baseUrlForMovie + AppConstans.topRatedMovie + AppConstans.apiKey}&page=$page");
    validateRespone(respone);
    return MovieItemEntity.fromJson(respone.data);
  }

  @override
  Future<MovieItemEntity> getPopular() async {
    final respone = await httpClient.get(
        AppConstans.baseUrlForMovie + AppConstans.popular + AppConstans.apiKey);
    validateRespone(respone);
    return MovieItemEntity.fromJson(respone.data);
  }

  @override
  Future<MovieItemEntity> getTopRatedTabBar({required int page}) async {
    final respone = await httpClient.get(
        "${AppConstans.baseUrlForMovie + AppConstans.topRatedMovie + AppConstans.apiKey}&page=$page");
    validateRespone(respone);
    return MovieItemEntity.fromJson(respone.data);
  }
}
