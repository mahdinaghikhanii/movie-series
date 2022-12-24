import '../../common/http_client.dart';
import '../entity/now_playing_item.dart';
import '../source/now_playing_data_source.dart';

final nowPlayingRepository =
    NowPlayingRepository(NowPlayingDataSource(httpClint));

abstract class INowPlayingRepository {
  Future<NowPlayingItemEntity> getNowPlaying();
}

class NowPlayingRepository implements INowPlayingRepository {
  INowPlayingDataSource nowPlayingDataSource;
  NowPlayingRepository(this.nowPlayingDataSource);
  @override
  Future<NowPlayingItemEntity> getNowPlaying() {
    return nowPlayingDataSource.getNowPlaying();
  }
}
