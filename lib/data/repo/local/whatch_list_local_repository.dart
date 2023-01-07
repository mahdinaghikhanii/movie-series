import 'package:flutter/material.dart';

import '../../entity/resultItem_movie.dart';
import '../../source/local/whatch_list_local_data_source.dart';

abstract class IWatchListLocalRepository {
  Future<List<ResultItemMovieEntity>> getAll();
  Future<void> deleteById(int id);
  Future<void> deleteAll();
  Future<ResultItemMovieEntity> createOrUpdate(ResultItemMovieEntity data);
}

class WatchListLocalRepository extends ChangeNotifier
    implements IWatchListLocalRepository {
  IWatchListLocalDataSource dataSource;
  WatchListLocalRepository(this.dataSource);
  @override
  Future<ResultItemMovieEntity> createOrUpdate(
      ResultItemMovieEntity data) async {
    final items = await dataSource.createOrUpdate(data);
    notifyListeners();
    return items;
  }

  @override
  Future<void> deleteAll() {
    return dataSource.deleteAll();
  }

  @override
  Future<void> deleteById(int id) {
    return dataSource.deleteById(id);
  }

  @override
  Future<List<ResultItemMovieEntity>> getAll() async {
    final itesm = await dataSource.getAll();
    notifyListeners();
    return itesm;
  }
}
