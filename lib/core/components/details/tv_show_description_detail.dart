import 'package:clean_arch_movie_flutter/core/components/details/dot_circle.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/episode_details.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/season_details.dart';
import 'package:flutter/material.dart';

abstract class TvShowDescriptionDetail extends StatelessWidget {
  const TvShowDescriptionDetail({
    super.key,
    required this.lastEpisode,
    required this.genres,
    required this.seasons,
  });

  final EpisodeDetailEntity lastEpisode;
  final List<String> genres;
  final List<SeasonDetailsEntity> seasons;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    if (lastEpisode.number != 0 &&
        lastEpisode.season != 0 &&
        genres.isNotEmpty &&
        seasons.isNotEmpty) {
      return Row(
        children: [
          Text(
            'S${lastEpisode.season}E${lastEpisode.number}',
            style: textTheme.bodyLarge,
          ),
          const DotCircle(),
          if (genres.isNotEmpty) ...[
            Text(
              genres[0],
              style: textTheme.bodyLarge,
            ),
            const DotCircle(),
          ] else ...[
            if (seasons.isNotEmpty) ...[
              const DotCircle(),
            ]
          ],
          Text(
            ' ${seasons.length} ${seasons.length > 1 ? 'Seasons' : 'Season'}',
            style: textTheme.bodyLarge,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
