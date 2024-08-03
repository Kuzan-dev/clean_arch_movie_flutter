
import 'package:clean_arch_movie_flutter/domain/entities/media/media.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/episode.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/season.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/cast.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/review.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MediaDetailEntity extends Equatable {
  final int? id;
  final String? title;
  final String? posterUrl;
  final String? backdropUrl;
  final String? releaseDate;
  final EpisodeEntity? lastEpisodeToAir;
  final String? genres;
  final String? runtime;
  final int? numberOfSeasons;
  final String? overview;
  final double? voteAverage;
  final String? voteCount;
  final String? trailerUrl;
  final List<CastEntity>? cast;
  final List<ReviewEntity>? reviews;
  final List<SeasonEntity>? seasons;
  final List<MediaEntity>? similar;
  bool isSaved;

  MediaDetailEntity({
    this.id,
    this.title,
    this.posterUrl,
    this.backdropUrl,
    this.releaseDate,
    this.lastEpisodeToAir,
    this.genres,
    this.runtime,
    this.numberOfSeasons,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.trailerUrl,
    this.cast,
    this.reviews,
    this.seasons,
    this.similar,
    this.isSaved = false,
  });


  @override
  List<Object?> get props => [
    id,
    title,
    posterUrl,
    backdropUrl,
    releaseDate,
    lastEpisodeToAir,
    genres,
    runtime,
    numberOfSeasons,
    overview,
    voteAverage,
    voteCount,
    trailerUrl,
    cast,
    reviews,
    seasons,
    similar,
    isSaved,
  ];
}