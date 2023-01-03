import 'package:movie_series/data/entity/resultItem_movie.dart';

abstract class IWatchListLocalRepository {
  Future<List<ResultItemMovieEntity>> getAll();
  Future<ResultItemMovieEntity> findById();
  Future<void> deleteById(int id);
  Future<void> deleteAll();
  Future<ResultItemMovieEntity> createOrUpdate(ResultItemMovieEntity data);
}

class WatchListLocalRepository implements IWatchListLocalRepository {
  @override
  Future<ResultItemMovieEntity> createOrUpdate(ResultItemMovieEntity data) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<ResultItemMovieEntity> findById() {
    throw UnimplementedError();
  }

  @override
  Future<List<ResultItemMovieEntity>> getAll() {
    throw UnimplementedError();
  }
}
