import '../../common/http_client.dart';
import '../entity/movie_item.dart';
import '../source/now_playing_data_source.dart';

final movieRepository = MovieRepository(MovieDataSource(httpClint));

abstract class IMovieRepository {
  Future<MovieItemEntity> getNowPlaying();
  Future<MovieItemEntity> getUpCominf();
  Future<MovieItemEntity> getTopRated({required int page});
  Future<MovieItemEntity> getTopRatedTabBar({required int page});
  Future<MovieItemEntity> getPopular();
}

class MovieRepository implements IMovieRepository {
  IMovieDataSource movieDataSource;
  MovieRepository(this.movieDataSource);
  @override
  Future<MovieItemEntity> getNowPlaying() {
    return movieDataSource.getNowPlaying();
  }

  @override
  Future<MovieItemEntity> getUpCominf() {
    return movieDataSource.getUpCominf();
  }

  @override
  Future<MovieItemEntity> getPopular() {
    return movieDataSource.getPopular();
  }

  @override
  Future<MovieItemEntity> getTopRated({required int page}) {
    return movieDataSource.getTopRated(page: page);
  }

  @override
  Future<MovieItemEntity> getTopRatedTabBar({required int page}) {
    return movieDataSource.getTopRatedTabBar(page: page);
  }
}
