
import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/data/models/util/cast_model.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/cast_list.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cast_list_model.g.dart';

@JsonSerializable()
class CastListModel extends Equatable with EntityConvertible<CastListModel, CastListEntity> {
  final int? id;
  final List<CastModel> cast;

  const CastListModel({
    this.id,
    required this.cast,
  });

  factory CastListModel.fromJson(Map<String, dynamic> json) => _$CastListModelFromJson(json);

  @override
  CastListEntity toEntity() {
    return CastListEntity(
      id: id,
      cast: cast.map((e) => e.toEntity()).toList(),
    );
  }

  Map<String, dynamic> toJson() => _$CastListModelToJson(this);

  @override
  List<Object?> get props => [id, cast];
}