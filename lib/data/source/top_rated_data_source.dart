import 'package:dio/dio.dart';
import '../../common/app_constans.dart';

import '../common/htttp_validate_respone.dart';
import '../entity/resultItem.dart';

abstract class IRemoteTopRatedDataSource {
  Future<List<ResultItemEntity>> getTopRated();
}

class RemoteTopRatedDataSource
    with HttpValidateRespone
    implements IRemoteTopRatedDataSource {
  final Dio httpClient;
  RemoteTopRatedDataSource(this.httpClient);
  @override
  Future<List<ResultItemEntity>> getTopRated() async {
    final respone = await httpClient.get(AppConstans.baseUrlForMovie +
        AppConstans.topRatedMovie +
        AppConstans.apiKey);

    validateRespone(respone);
    List<ResultItemEntity> entity = [];

    for (var json in (respone.data['results'] as List)) {
      entity.add(ResultItemEntity.fromJson(json));
    }

    return entity;
  }
}
