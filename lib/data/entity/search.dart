class SearchEntiry {
  final int page;
  final List<SearchResultsEntity> results;
  final int totalPages;
  final int totalResults;

  SearchEntiry(this.page, this.results, this.totalPages, this.totalResults);

  SearchEntiry.fromJson(Map<String, dynamic> json)
      : page = json['page'],
        results = SearchResultsEntity.parssJsonArray(json['results']),
        totalPages = json['total_pages'],
        totalResults = json['total_results'];
}

class SearchResultsEntity {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final String voteAverage;
  final String voteCount;

  SearchResultsEntity.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdropPath = json['backdrop_path'] ?? "",
        genreIds = json['genre_ids'].cast<int>(),
        id = json['id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        title = json['title'],
        video = json['video'],
        voteAverage = json['vote_average'].toString(),
        voteCount = json['vote_count'].toString();

  static List<SearchResultsEntity> parssJsonArray(List<dynamic> jsonArray) {
    final List<SearchResultsEntity> item = [];

    for (var json in jsonArray) {
      item.add(SearchResultsEntity.fromJson(json));
    }
    return item;
  }
}
