import 'resultItem_movie.dart';

class TopRatedEntity {
  final int page;
  final List<ResultItemMovieEntity> results;
  final int totalPages;
  final int totalResults;

  TopRatedEntity.fromJson(Map<String, dynamic> json)
      : page = json['page'],
        results = ResultItemMovieEntity.parssJsonArray(json['results']),
        totalPages = json['total_pages'],
        totalResults = json['total_results'];
}
