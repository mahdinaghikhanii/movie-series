import 'package:hive_flutter/adapters.dart';
import 'package:movie_series/data/entity/resultItem_movie.dart';

abstract class IWatchListLocalDataSource {
  Future<List<ResultItemMovieEntity>> getAll();

  Future<void> deleteById(int id);
  Future<void> deleteAll();
  Future<void> delete(ResultItemMovieEntity data);
  Future<ResultItemMovieEntity> createOrUpdate(ResultItemMovieEntity data);
}

class WatchListLocalDataSource implements IWatchListLocalDataSource {
  final Box<ResultItemMovieEntity> box;
  WatchListLocalDataSource(this.box);

  @override
  Future<ResultItemMovieEntity> createOrUpdate(
      ResultItemMovieEntity data) async {
    if (data.isInBox) {
      data.save();
    } else {
      data.id = await box.add(data);
    }
    return data;
  }

  @override
  Future<void> deleteAll() {
    return box.clear();
  }

  @override
  Future<void> deleteById(int id) {
    return box.delete(id);
  }

  @override
  Future<List<ResultItemMovieEntity>> getAll() async {
    return box.values.toList();
  }

  @override
  Future<void> delete(ResultItemMovieEntity data) {
    return data.delete();
  }
}
