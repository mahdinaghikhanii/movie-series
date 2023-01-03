import 'package:movie_series/common/http_client.dart';
import 'package:movie_series/data/entity/information_movie.dart';
import 'package:movie_series/data/source/remote/information_movie_data_source.dart';

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
