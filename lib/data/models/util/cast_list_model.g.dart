// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastListModel _$CastListModelFromJson(Map<String, dynamic> json) =>
    CastListModel(
      id: (json['id'] as num?)?.toInt(),
      cast: (json['cast'] as List<dynamic>)
          .map((e) => CastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CastListModelToJson(CastListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
    };
