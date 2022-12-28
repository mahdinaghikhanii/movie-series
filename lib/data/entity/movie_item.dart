import 'resultItem_movie.dart';

class MovieItemEntity {
  final int page;
  final List<ResultItemMovieEntity> resultEntity;
  final int totalPages;
  final int totalResult;

  MovieItemEntity.fromJson(Map<String, dynamic> json)
      : page = json['page'],
        resultEntity = ResultItemMovieEntity.parssJsonArray(json['results']),
        totalPages = json['total_pages'] as int,
        totalResult = json['total_results'] as int;
}
