import 'package:movie_series/common/http_client.dart';
import 'package:movie_series/data/source/remote/reviews_movie_data_source.dart';

import '../../entity/reviews.dart';

final reviewsRepository =
    ReviewsMovieRepository(ReviewsMovieDataSource(httpClint));

abstract class IReviewsMovieRepository {
  Future<ReviewsEntiry> getReviews({required String idMovie});
}

class ReviewsMovieRepository implements IReviewsMovieRepository {
  IReviewsMovieDataSource iReviewsMovieDataSource;
  ReviewsMovieRepository(this.iReviewsMovieDataSource);
  @override
  Future<ReviewsEntiry> getReviews({required String idMovie}) {
    return iReviewsMovieDataSource.getReviews(idMovie: idMovie);
  }
}
