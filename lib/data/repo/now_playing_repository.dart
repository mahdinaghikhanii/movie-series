import 'package:movie_series/common/http_client.dart';
import 'package:movie_series/data/entity/top_rated_item.dart';
import 'package:movie_series/data/source/now_playing_data_source.dart';

final nowPlayingRepository =
    NowPlayingRepository(NowPlayingDataSource(httpClint));

abstract class INowPlayingRepository {
  Future<List<TopRatedItemEntity>> getNowPlaying();
}

class NowPlayingRepository implements INowPlayingRepository {
  INowPlayingDataSource nowPlayingDataSource;
  NowPlayingRepository(this.nowPlayingDataSource);
  @override
  Future<List<TopRatedItemEntity>> getNowPlaying() {
    return nowPlayingDataSource.getNowPlaying();
  }
}
