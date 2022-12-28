// ignore_for_file: file_names

class ResultItemMovieEntity {
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
  final String voteAverage;
  final int voteCount;

  ResultItemMovieEntity(
      this.adult,
      this.backdropPath,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  ResultItemMovieEntity.fromJson(Map<String, dynamic> json)
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
        voteAverage = json['vote_average'].toString(),
        voteCount = json['vote_count'];

  static List<ResultItemMovieEntity> parssJsonArray(List<dynamic> jsonArray) {
    final List<ResultItemMovieEntity> item = [];

    for (var json in jsonArray) {
      item.add(ResultItemMovieEntity.fromJson(json));
    }
    return item;
  }
}
