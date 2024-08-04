import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/movies/movie_details.dart';
import 'package:isar/isar.dart';

part 'movie_details_collection.g.dart';

@collection
class MovieDetailsCollection with EntityConvertible<MovieDetailsCollection, MovieDetailsEntity> {
  
  final Id? id;
  final String? title;
  final String? posterUrl;
  final String? backdropUrl;
  final String? releaseDate;
  final List<String>? genres;
  final String? runtime;
  final String? overview;
  final double? voteAverage;
  final String? voteCount;
  final String? trailerUrl;
  
  MovieDetailsCollection({
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
  MovieDetailsEntity toEntity() => MovieDetailsEntity(
        id: id,
        title: title,
        posterUrl: posterUrl,
        backdropUrl: backdropUrl,
        releaseDate: releaseDate,
        genres: genres,
        runtime: runtime,
        overview: overview,
        voteAverage: voteAverage,
        voteCount: voteCount,
        trailerUrl: trailerUrl,
      );

  @override
  MovieDetailsCollection fromEntity(MovieDetailsEntity? model) {
    return MovieDetailsCollection(
      id: model?.id,
      title: model?.title,
      posterUrl: model?.posterUrl,
      backdropUrl: model?.backdropUrl,
      releaseDate: model?.releaseDate,
      genres: model?.genres,
      runtime: model?.runtime,
      overview: model?.overview,
      voteAverage: model?.voteAverage,
      voteCount: model?.voteCount,
      trailerUrl: model?.trailerUrl,
    );
  }
}