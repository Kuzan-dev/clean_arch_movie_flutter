import 'package:equatable/equatable.dart';
import './episode.dart';

class SeasonDetailEntity extends Equatable {
  final List<EpisodeEntity> episodes;

  const SeasonDetailEntity({
    required this.episodes,
  });

  @override
  List<Object?> get props => [
        episodes,
      ];
}
