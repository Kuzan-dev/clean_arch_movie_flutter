import 'package:equatable/equatable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/episode_details.dart';

class EpisodeListEntity extends Equatable {
  final List<EpisodeDetailEntity>? episodes;

  const EpisodeListEntity({
    required this.episodes,
  });

  @override
  List<Object?> get props => [
        episodes,
      ];
}
