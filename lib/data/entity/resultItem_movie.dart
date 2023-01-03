// ignore_for_file: file_names
import 'package:hive_flutter/hive_flutter.dart';

part 'resultItem_movie.g.dart';

@HiveType(typeId: 0)
class ResultItemMovieEntity extends HiveObject {
  @HiveField(0)
  final bool adult;
  @HiveField(1)
  final String backdropPath;
  @HiveField(2)
  int id;
  @HiveField(3)
  final String originalLanguage;
  @HiveField(4)
  final String originalTitle;
  @HiveField(5)
  final String overview;
  @HiveField(6)
  final String popularity;
  @HiveField(7)
  final String posterPath;
  @HiveField(8)
  final String releaseDate;
  @HiveField(9)
  final String title;
  @HiveField(10)
  final bool video;
  @HiveField(11)
  final String voteAverage;
  @HiveField(12)
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
        popularity = json['popularity'].toString(),
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
