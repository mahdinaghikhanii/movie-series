import 'package:flutter/material.dart';

class ResultItemEntity {
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
  // final double voteAverage;
  final int voteCount;

  ResultItemEntity(
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
      // this.voteAverage,
      this.voteCount);

  ResultItemEntity.fromJson(Map<String, dynamic> json)
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
        //   voteAverage = json['vote_average'],
        voteCount = json['vote_count'];

  static List<ResultItemEntity> parssJsonArray(List<dynamic> jsonArray) {
    final List<ResultItemEntity> item = [];

    for (var json in jsonArray) {
      item.add(ResultItemEntity.fromJson(json));
    }
    return item;
  }
}
