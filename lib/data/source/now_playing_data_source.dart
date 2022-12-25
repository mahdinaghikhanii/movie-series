import 'package:dio/dio.dart';
import '../entity/now_playing_item.dart';
import '../../common/app_constans.dart';

import '../common/htttp_validate_respone.dart';

abstract class INowPlayingDataSource {
  Future<NowPlayingItemEntity> getNowPlaying();
}

class NowPlayingDataSource
    with HttpValidateRespone
    implements INowPlayingDataSource {
  final Dio httpClient;
  NowPlayingDataSource(this.httpClient);
  @override
  Future<NowPlayingItemEntity> getNowPlaying() async {
    final respone = await httpClient.get(AppConstans.baseUrlForMovie +
        AppConstans.nowPlaying +
        AppConstans.apiKey);
    validateRespone(respone);
    return NowPlayingItemEntity.fromJson(respone.data);
  }
}
