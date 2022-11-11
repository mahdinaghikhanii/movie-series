import 'top_rated_item.dart';

class TopRatedEntity {
  final int page;
  final List<TopRatedItemEntity> results;
  final int totalPages;
  final int totalResults;

  TopRatedEntity.fromJson(Map<String, dynamic> json)
      : page = json['page'],
        results = TopRatedItemEntity.parssJsonArray(json['results']),
        totalPages = json['total_pages'],
        totalResults = json['total_results'];
}
