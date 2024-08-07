import 'package:equatable/equatable.dart';

class TvShowDetailsEntity extends Equatable {
  final int? id;
  final String? title;
  final String? posterUrl;
  final String? backdropUrl;
  final String? releaseDate;
  final List<String>? genres;
  final String? runtime;
  final int? numberOfSeasons;
  final String? overview;
  final double? voteAverage;
  //final String? voteCount;
  final String? trailerUrl;

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
    //this.voteCount,
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
        numberOfSeasons,
        overview,
        voteAverage,
        //voteCount,
        trailerUrl,
      ];
}
