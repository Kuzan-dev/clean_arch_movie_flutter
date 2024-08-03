// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeDetailsModel _$EpisodeDetailsModelFromJson(Map<String, dynamic> json) =>
    EpisodeDetailsModel(
      number: (json['episode_number'] as num?)?.toInt(),
      season: (json['season_number'] as num?)?.toInt(),
      name: json['name'] as String?,
      runtime: json['runtime'] as String?,
      stillPath: json['still_path'] as String?,
      airDate: json['air_date'] as String?,
    );

Map<String, dynamic> _$EpisodeDetailsModelToJson(
        EpisodeDetailsModel instance) =>
    <String, dynamic>{
      'episode_number': instance.number,
      'season_number': instance.season,
      'name': instance.name,
      'runtime': instance.runtime,
      'still_path': instance.stillPath,
      'air_date': instance.airDate,
    };
