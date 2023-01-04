import 'package:dio/dio.dart';
import 'package:movie_series/data/common/htttp_validate_respone.dart';

import 'package:movie_series/data/entity/search.dart';

abstract class ISearchMovieDataSource {
  Future<SearchResultsEntity> getSearch({required String query});
}

class SearchMovieDataSource extends ISearchMovieDataSource
    with HttpValidateRespone {
  final Dio httpClient;
  SearchMovieDataSource(this.httpClient);
  @override
  Future<SearchResultsEntity> getSearch({required String query}) async {
    Response response = await httpClient.get(
        "/search/movie?api_key=caeeae4ccb1c5ddacd05161e7217a2e6&language=en-US&query=$query&page=1&include_adult=false");
    validateRespone(response);

    return SearchResultsEntity.fromJson(response.data);
  }
}
