import 'package:movie_series/data/entity/search.dart';
import 'package:movie_series/data/source/remote/search_movie_data_source.dart';

abstract class ISearchMovieRemoteRepository {
  Future<SearchResultsEntity> getSearch({required String query});
}

class SearchMovieRemoteRepository implements ISearchMovieRemoteRepository {
  ISearchMovieDataSource searchMovieDataSource;
  SearchMovieRemoteRepository(this.searchMovieDataSource);

  @override
  Future<SearchResultsEntity> getSearch({required String query}) {
    return searchMovieDataSource.getSearch(query: query);
  }
}
