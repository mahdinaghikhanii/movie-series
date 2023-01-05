import 'package:dio/dio.dart';

import '../../common/htttp_validate_respone.dart';
import '../../entity/search.dart';

abstract class ISearchMovieDataSource {
  Future<SearchEntiry> getSearch({required String query});
}

class SearchMovieDataSource extends ISearchMovieDataSource
    with HttpValidateRespone {
  final Dio httpClient;
  SearchMovieDataSource(this.httpClient);
  @override
  Future<SearchEntiry> getSearch({required String query}) async {
    Response response = await httpClient.get(
        "/search/movie?api_key=caeeae4ccb1c5ddacd05161e7217a2e6&language=en-US&query=$query&page=1&include_adult=false");
    validateRespone(response);

    return SearchEntiry.fromJson(response.data);
  }
}
