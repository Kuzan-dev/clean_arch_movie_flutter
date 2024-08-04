import 'package:equatable/equatable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/episode_details.dart';

class SeasonDetailsEntity extends Equatable {
  final int? tmdbID;
  final String? name;
  final String? airDate;
  final String? overview;
  final String? posterUrl;
  final int? seasonNumber;
  final List<EpisodeDetailEntity>? episodes;

  const SeasonDetailsEntity({
    required this.tmdbID,
    required this.name,
    required this.airDate,
    required this.overview,
    required this.posterUrl,
    required this.seasonNumber,
    required this.episodes,
  });

  @override
  List<Object?> get props => [
        tmdbID,
        name,
        airDate,
        overview,
        posterUrl,
        seasonNumber,
        episodes,
      ];
}
