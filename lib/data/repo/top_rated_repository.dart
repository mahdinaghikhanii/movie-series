import '../../common/http_client.dart';
import '../entity/resultItem.dart';
import '../source/top_rated_data_source.dart';

final topRatedRepository =
    TopRatedRepository(RemoteTopRatedDataSource(httpClint));

abstract class ITopRatedRepository {
  Future<List<ResultItemEntity>> getTopRated();
}

class TopRatedRepository implements ITopRatedRepository {
  IRemoteTopRatedDataSource topRatedDataSource;
  TopRatedRepository(this.topRatedDataSource);
  @override
  Future<List<ResultItemEntity>> getTopRated() {
    return topRatedDataSource.getTopRated();
  }
}
