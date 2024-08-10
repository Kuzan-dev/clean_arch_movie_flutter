import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';

import 'package:isar/isar.dart';

part 'tv_show_detail_collection.g.dart';

@Collection()
class TvShowDetailsCollection
    with EntityConvertible<TvShowDetailsCollection, TvShowDetailsEntity> {
  final Id? id;
  final String? title;
  final String? posterUrl;
  final String? backdropUrl;
  final String? releaseDate;

  final int? runtime;
  final int? numberOfSeasons;
  final String? overview;
  final double? voteAverage;

  //final String? voteCount;
  final String? trailerUrl;

  TvShowDetailsCollection({
    this.id,
    this.title,
    this.posterUrl,
    this.backdropUrl,
    this.releaseDate,
    this.runtime,
    this.numberOfSeasons,
    this.overview,
    this.voteAverage,

    //this.voteCount,
    this.trailerUrl,
  });

  @override
  TvShowDetailsEntity toEntity() {
    return TvShowDetailsEntity(
      id: id,
      title: title,
      posterUrl: posterUrl,
      backdropUrl: backdropUrl,
      releaseDate: releaseDate,

      runtime: runtime,
      numberOfSeasons: numberOfSeasons,
      overview: overview,
      voteAverage: voteAverage,

      //voteCount: voteCount,
      trailerUrl: trailerUrl,
    );
  }

  @override
  TvShowDetailsCollection fromEntity(TvShowDetailsEntity? model) {
    return TvShowDetailsCollection(
      id: model?.id,
      title: model?.title,
      posterUrl: model?.posterUrl,
      backdropUrl: model?.backdropUrl,
      releaseDate: model?.releaseDate,

      runtime: model?.runtime,
      numberOfSeasons: model?.numberOfSeasons,
      overview: model?.overview,
      voteAverage: model?.voteAverage,

      //voteCount: model?.voteCount,
      trailerUrl: model?.trailerUrl,
    );
  }
}
