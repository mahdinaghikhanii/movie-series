import 'resultItem.dart';

class TopRatedEntity {
  final int page;
  final List<ResultItemEntity> results;
  final int totalPages;
  final int totalResults;

  TopRatedEntity.fromJson(Map<String, dynamic> json)
      : page = json['page'],
        results = ResultItemEntity.parssJsonArray(json['results']),
        totalPages = json['total_pages'],
        totalResults = json['total_results'];
}
