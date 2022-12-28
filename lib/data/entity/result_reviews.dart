import 'package:movie_series/data/entity/auther_details.dart';

class ResultsReviewsEntity {
  final String author;
  final List<AuthorDetails> authorDetails;
  final String content;
  final String createdAt;
  final String id;
  final String updatedAt;
  final String url;

  ResultsReviewsEntity.fromJson(Map<String, dynamic> json)
      : author = json['author'],
        authorDetails =
            AuthorDetails.parssJsonArrayAuther(json['author_details']),
        content = json['content'],
        createdAt = json['created_at'],
        id = json['id'],
        updatedAt = json['updated_at'],
        url = json['url'];

  static List<ResultsReviewsEntity> parssJsonArray(List<dynamic> jsonArray) {
    final List<ResultsReviewsEntity> item = [];

    for (var json in jsonArray) {
      item.add(ResultsReviewsEntity.fromJson(json));
    }
    return item;
  }
}
