import '../../common/http_client.dart';
import '../entity/top_rated_item.dart';
import '../source/top_rated_data_source.dart';

final topRatedRepository =
    TopRatedRepository(RemoteTopRatedDataSource(httpClint));

abstract class ITopRatedRepository {
  Future<List<TopRatedItemEntity>> getTopRated();
}

class TopRatedRepository implements ITopRatedRepository {
  IRemoteTopRatedDataSource topRatedDataSource;
  TopRatedRepository(this.topRatedDataSource);
  @override
  Future<List<TopRatedItemEntity>> getTopRated() {
    return topRatedDataSource.getTopRated();
  }
}
