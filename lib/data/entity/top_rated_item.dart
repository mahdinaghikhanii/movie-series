class TopRatedItemEntity {
  final bool adult;
  final String backdropPath;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  TopRatedItemEntity.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdropPath = json['backdrop_path'],
        id = json['id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        title = json['title'],
        video = json['video'],
        voteAverage = json['vote_average'],
        voteCount = json['vote_count'];

  static List<TopRatedItemEntity> parssJsonArray(List<dynamic> jsonArray) {
    final List<TopRatedItemEntity> item = [];

    (jsonArray as List).forEach((json) {
      item.add(TopRatedItemEntity.fromJson(json));
    });

    return item;
  }
}
