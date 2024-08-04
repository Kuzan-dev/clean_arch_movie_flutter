import 'package:equatable/equatable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/episode_details.dart';

class EpisodeListEntity extends Equatable {
  final String id;
  final List<EpisodeDetailEntity>? episodes;

  const EpisodeListEntity({
    required this.id,
    required this.episodes,
  });

  @override
  List<Object?> get props => [
        id,
        episodes,
      ];
}
