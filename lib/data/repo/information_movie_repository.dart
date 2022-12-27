import 'package:movie_series/data/entity/information_movie.dart';
import 'package:movie_series/data/source/information_movie_data_source.dart';

abstract class IInformationMovieRepository {
  Future<InformationMovie> getInformationMovie({required String idMovie});
}

class InformationMovieRepository implements IInformationMovieRepository {
  IInformationMovieDataSourec dataSourec;
  InformationMovieRepository(this.dataSourec);

  @override
  Future<InformationMovie> getInformationMovie({required String idMovie}) {
    return dataSourec.getInformationMovie(idMovie: idMovie);
  }
}
