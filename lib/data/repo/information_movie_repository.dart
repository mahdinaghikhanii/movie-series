import '../../common/http_client.dart';
import '../entity/information_movie.dart';
import '../source/information_movie_data_source.dart';

final informationRepository =
    InformationMovieRepository(InformationMovieDataSourec(httpClint));

abstract class IInformationMovieRepository {
  Future<InformationMovieEntity> getInformationMovie({required String idMovie});
}

class InformationMovieRepository implements IInformationMovieRepository {
  IInformationMovieDataSourec dataSourec;
  InformationMovieRepository(this.dataSourec);

  @override
  Future<InformationMovieEntity> getInformationMovie(
      {required String idMovie}) {
    return dataSourec.getInformationMovie(idMovie: idMovie);
  }
}
