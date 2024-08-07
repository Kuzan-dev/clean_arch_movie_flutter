import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_details.dart';

part 'tv_show_details_model.g.dart';

@JsonSerializable()
class TvShowDetailsModel extends Equatable
    with EntityConvertible<TvShowDetailsModel, TvShowDetailsEntity> {
  final int? id;
  @JsonKey(name: 'name')
  final String? title;
  @JsonKey(name: 'poster_path')
  final String? posterUrl;
  @JsonKey(name: 'backdrop_path')
  final String? backdropUrl;
  @JsonKey(name: 'first_air_date')
  final String? releaseDate;
  final List<String>? genres;
  @JsonKey(name: 'number_of_seasons')
  final int? numberOfSeasons;
  final String? overview;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  //@JsonKey(name: 'vote_count')
  //final String? voteCount;
  @JsonKey(name: 'trailer_url')
  final String? trailerUrl;

  TvShowDetailsModel({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    required this.releaseDate,
    required this.genres,
    required this.numberOfSeasons,
    required this.overview,
    required this.voteAverage,
    //required this.voteCount,
    required this.trailerUrl,
  });

  factory TvShowDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowDetailsModelFromJson(json);


  @override
  List<Object?> get props => [
        id,
        title,
        posterUrl,
        backdropUrl,
        releaseDate,
        genres,
        numberOfSeasons,
        overview,
        voteAverage,
        //voteCount,
        trailerUrl,
      ];
  
  Map<String, dynamic> toJson() => _$TvShowDetailsModelToJson(this);

  @override
  TvShowDetailsEntity toEntity() => TvShowDetailsEntity(
        id: id,
        title: title,
        posterUrl: posterUrl,
        backdropUrl: backdropUrl,
        releaseDate: releaseDate,
        genres: genres,
        numberOfSeasons: numberOfSeasons,
        overview: overview,
        voteAverage: voteAverage,
        //voteCount: voteCount,
        trailerUrl: trailerUrl,
      );
}
