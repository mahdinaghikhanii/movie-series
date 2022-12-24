import 'package:movie_series/data/entity/resultItem.dart';

class NowPlayingItemEntity {
  final int page;
  final List<ResultItemEntity> resultEntity;
  final int totalPages;
  final int totalResult;

  NowPlayingItemEntity.fromJson(Map<String, dynamic> json)
      : page = json['page'],
        resultEntity = ResultItemEntity.parssJsonArray(json['results']),
        totalPages = json['total_pages'] as int,
        totalResult = json['total_results'] as int;
}
