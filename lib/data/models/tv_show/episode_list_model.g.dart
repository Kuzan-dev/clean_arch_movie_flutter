// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeListModel _$EpisodeListModelFromJson(Map<String, dynamic> json) =>
    EpisodeListModel(
      id: (json['id'] as num?)?.toInt(),
      episodes: (json['results'] as List<dynamic>?)
          ?.map((e) => EpisodeDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EpisodeListModelToJson(EpisodeListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.episodes,
    };
