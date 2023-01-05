import '../../../common/http_client.dart';
import '../../entity/search.dart';
import '../../source/remote/search_movie_data_source.dart';

final searchMovieRepository =
    SearchMovieRemoteRepository(SearchMovieDataSource(httpClint));

abstract class ISearchMovieRemoteRepository {
  Future<SearchEntiry> getSearch({required String query});
}

class SearchMovieRemoteRepository implements ISearchMovieRemoteRepository {
  ISearchMovieDataSource searchMovieDataSource;
  SearchMovieRemoteRepository(this.searchMovieDataSource);

  @override
  Future<SearchEntiry> getSearch({required String query}) {
    return searchMovieDataSource.getSearch(query: query);
  }
}
