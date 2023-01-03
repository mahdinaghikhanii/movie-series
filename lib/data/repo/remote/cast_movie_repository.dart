import '../../../common/http_client.dart';
import '../../entity/cast_movie.dart';
import '../../source/remote/cast_movie_data_source.dart';

final castMovieRepository = CastMovieRepository(CastMovieDataSource(httpClint));

abstract class ICastMovieRepository {
  Future<CastMovieEntity> getCastMovie({required String idMovie});
}

class CastMovieRepository implements ICastMovieRepository {
  final ICastMovieDataSource dataSource;
  CastMovieRepository(this.dataSource);
  @override
  Future<CastMovieEntity> getCastMovie({required String idMovie}) {
    return dataSource.getCastMvoie(idMovie: idMovie);
  }
}
