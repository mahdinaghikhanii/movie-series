import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../common/app_constans.dart';
import '../entity/resultItem.dart';

import '../common/htttp_validate_respone.dart';

abstract class INowPlayingDataSource {
  Future<List<ResultItemEntity>> getNowPlaying();
}

class NowPlayingDataSource
    with HttpValidateRespone
    implements INowPlayingDataSource {
  final Dio httpClient;
  NowPlayingDataSource(this.httpClient);
  @override
  Future<List<ResultItemEntity>> getNowPlaying() async {
    final respone = await httpClient.get(AppConstans.baseUrlForMovie +
        AppConstans.nowPlaying +
        AppConstans.apiKey);

    validateRespone(respone);

    List<ResultItemEntity> nowPlayingentity = [];

    for (var json in (respone.data['results'] as List)) {
      nowPlayingentity.add(ResultItemEntity.fromJson(json));
    }
    debugPrint(nowPlayingentity.toString());
    return nowPlayingentity;
  }
}
