// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonDetailsModel _$SeasonDetailsModelFromJson(Map<String, dynamic> json) =>
    SeasonDetailsModel(
      tmdbID: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      airDate: json['air_date'] as String?,
      overview: json['overview'] as String?,
      posterUrl: json['poster_path'] as String?,
      seasonNumber: (json['season_number'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SeasonDetailsModelToJson(SeasonDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.tmdbID,
      'name': instance.name,
      'air_date': instance.airDate,
      'overview': instance.overview,
      'poster_path': instance.posterUrl,
      'season_number': instance.seasonNumber,
    };
