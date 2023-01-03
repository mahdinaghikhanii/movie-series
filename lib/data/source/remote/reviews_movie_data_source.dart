import 'package:dio/dio.dart';
import 'package:movie_series/data/common/htttp_validate_respone.dart';
import 'package:movie_series/data/entity/reviews.dart';

abstract class IReviewsMovieDataSource {
  Future<ReviewsEntiry> getReviews({required String idMovie});
}

class ReviewsMovieDataSource
    with HttpValidateRespone
    implements IReviewsMovieDataSource {
  final Dio httpClient;
  ReviewsMovieDataSource(this.httpClient);
  @override
  Future<ReviewsEntiry> getReviews({required String idMovie}) async {
    Response response = await httpClient.get(
        "movie/$idMovie/reviews?api_key=caeeae4ccb1c5ddacd05161e7217a2e6&language=en-US");

    validateRespone(response);

    return ReviewsEntiry.fromJson(response.data);
  }
}
