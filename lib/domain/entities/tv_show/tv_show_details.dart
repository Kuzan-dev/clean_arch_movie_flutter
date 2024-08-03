import 'package:equatable/equatable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/season.dart';

class TvShowDetailsEntity extends Equatable {
  final int? id;
  final String? title;
  final String? posterUrl;
  final String? backdropUrl;
  final String? releaseDate;
  final String? genres;
  final String? runtime;
  final int? numberOfSeasons;
  final String? overview;
  final double? voteAverage;
  final String? voteCount;
  final String? trailerUrl;
  final List<SeasonEntity>? seasons;

  const TvShowDetailsEntity({
    this.id,
    this.title,
    this.posterUrl,
    this.backdropUrl,
    this.releaseDate,
    this.genres,
    this.runtime,
    this.numberOfSeasons,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.trailerUrl,
    this.seasons,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        posterUrl,
        backdropUrl,
        releaseDate,
        genres,
        runtime,
        numberOfSeasons,
        overview,
        voteAverage,
        voteCount,
        trailerUrl,
        seasons,
      ];
}
