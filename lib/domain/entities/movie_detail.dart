import 'package:equatable/equatable.dart';

import 'genre.dart';

class MovieDetail extends Equatable {
  const MovieDetail({
    this.adult,
    this.backdropPath,
    this.genres,
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.runtime,
    this.title,
    this.voteAverage,
    this.voteCount,
    this.budget,
    this.homepage,
    this.imdbId,
    this.originalLanguage,
    this.popularity,
    this.revenue,
    this.status,
    this.tagline,
    this.video,
  });

  final bool? adult;
  final String? backdropPath;
  final List<Genre>? genres;
  final int? id;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final int? runtime;
  final String? title;
  final double? voteAverage;
  final int? voteCount;
  final int? budget;
  final String? homepage;
  final String? imdbId;
  final String? originalLanguage;
  final double? popularity;
  final int? revenue;
  final String? status;
  final String? tagline;
  final bool? video;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genres,
        id,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        voteCount,
      ];
}
