import 'package:dio/dio.dart';
import 'package:movie_series/common/app_constans.dart';
import 'package:movie_series/data/entity/top_rated_item.dart';

import '../common/htttp_validate_respone.dart';

abstract class INowPlayingDataSource {
  Future<List<TopRatedItemEntity>> getNowPlaying();
}

class NowPlayingDataSource
    with HttpValidateRespone
    implements INowPlayingDataSource {
  final Dio httpClient;
  NowPlayingDataSource(this.httpClient);
  @override
  Future<List<TopRatedItemEntity>> getNowPlaying() async {
    final respone = await httpClient.get(AppConstans.nowPlaying);

    validateRespone(respone);

    List<TopRatedItemEntity> entity = [];

    for (var json in (respone.data['results'] as List)) {
      entity.add(TopRatedItemEntity.fromJson(json));
    }

    return entity;
  }
}
