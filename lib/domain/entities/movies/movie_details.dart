import 'package:equatable/equatable.dart';


class MovieDetailsEntity extends Equatable {
  final int? id;
  final String? title;
  final String? posterUrl;
  final String? backdropUrl;
  final String? releaseDate;
  final String? genres;
  final String? runtime;
  final String? overview;
  final double? voteAverage;
  final String? voteCount;
  final String? trailerUrl;


  const MovieDetailsEntity({
    this.id,
    this.title,
    this.posterUrl,
    this.backdropUrl,
    this.releaseDate,
    this.genres,
    this.runtime,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.trailerUrl,
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
        overview,
        voteAverage,
        voteCount,
        trailerUrl,
      ];
}