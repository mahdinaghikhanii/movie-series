import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
    final respone = await httpClient.get(AppConstans.baseUrlForMovie +
        AppConstans.nowPlaying +
        AppConstans.apiKey);

    validateRespone(respone);

    List<TopRatedItemEntity> nowPlayingentity = [];

    for (var json in (respone.data['results'] as List)) {
      nowPlayingentity.add(TopRatedItemEntity.fromJson(json));
    }
    debugPrint(nowPlayingentity.toString());
    return nowPlayingentity;
  }
}
