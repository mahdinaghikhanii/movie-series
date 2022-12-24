import '../../common/http_client.dart';
import '../entity/resultItem.dart';
import '../source/now_playing_data_source.dart';

final nowPlayingRepository =
    NowPlayingRepository(NowPlayingDataSource(httpClint));

abstract class INowPlayingRepository {
  Future<List<ResultItemEntity>> getNowPlaying();
}

class NowPlayingRepository implements INowPlayingRepository {
  INowPlayingDataSource nowPlayingDataSource;
  NowPlayingRepository(this.nowPlayingDataSource);
  @override
  Future<List<ResultItemEntity>> getNowPlaying() {
    return nowPlayingDataSource.getNowPlaying();
  }
}
