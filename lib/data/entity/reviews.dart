import 'package:movie_series/data/entity/result_reviews.dart';

class ReviewsEntiry {
  final int id;
  final int page;
  final List<ResultsReviewsEntity> results;
  final int totalPages;
  final int totalResults;

  ReviewsEntiry(
      this.id, this.page, this.results, this.totalPages, this.totalResults);

  ReviewsEntiry.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        page = json['page'],
        results = ResultsReviewsEntity.parssJsonArray(json['results']),
        totalPages = json['total_pages'],
        totalResults = json['total_results'];
}
