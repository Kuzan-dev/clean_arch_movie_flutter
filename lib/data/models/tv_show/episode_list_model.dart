import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/data/models/tv_show/episode_details_model.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/episode_list.dart';

part 'episode_list_model.g.dart';

@JsonSerializable()
class EpisodeListModel extends Equatable
    with EntityConvertible<EpisodeListModel, EpisodeListEntity> {
  @JsonKey(name: 'results')
  final List<EpisodeDetailsModel>? episodes;

  EpisodeListModel({
    required this.episodes,
  });

  factory EpisodeListModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeListModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeListModelToJson(this);

  @override
  List<Object?> get props => [
        episodes,
      ];

  @override
  EpisodeListEntity toEntity() => EpisodeListEntity(
        episodes: episodes?.map((e) => e.toEntity()).toList(),
      );
}
