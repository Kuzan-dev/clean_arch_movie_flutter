import 'package:clean_arch_movie_flutter/domain/entities/tv_show/season_details.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';

part 'season_details.g.dart';

@JsonSerializable()
class SeasonDetailsModel extends Equatable
    with EntityConvertible<SeasonDetailsModel, SeasonDetailsEntity> {
  @JsonKey(name: 'id')
  final int? tmdbID;
  final String? name;
  @JsonKey(name: 'air_date')
  final String? airDate;
  final String? overview;
  @JsonKey(name: 'poster_path')
  final String? posterUrl;
  @JsonKey(name: 'season_number')
  final int? seasonNumber;

  SeasonDetailsModel({
    required this.tmdbID,
    required this.name,
    required this.airDate,
    required this.overview,
    required this.posterUrl,
    required this.seasonNumber,
  });

  factory SeasonDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonDetailsModelToJson(this);

  @override
  List<Object?> get props => [
        tmdbID,
        name,
        airDate,
        overview,
        posterUrl,
        seasonNumber,
      ];

  @override
  SeasonDetailsEntity toEntity() => SeasonDetailsEntity(
        tmdbID: tmdbID,
        name: name,
        airDate: airDate,
        overview: overview,
        posterUrl: posterUrl,
        seasonNumber: seasonNumber,
      );
}
