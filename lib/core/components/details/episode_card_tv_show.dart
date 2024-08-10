import 'package:clean_arch_movie_flutter/core/components/carrousell/image_with_shimmer.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EpisodeCardTvShow extends StatelessWidget {
  const EpisodeCardTvShow({
    super.key,
    required this.episode,
  });

  final EpisodeDetailEntity? episode;

  @override
  Widget build(BuildContext context) {
    String formattedDate = '';
    if (episode?.airDate != null) {
      final DateTime parsedDate = DateTime.parse(episode!.airDate!);
      formattedDate = DateFormat('MMM dd yyyy').format(parsedDate);
    }

    return Container(
      height: 84,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageWithShimmer(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${episode?.stillPath}',
                width: 150,
                height: double.infinity,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'S${episode?.season} E${episode?.number}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  episode!.name!,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '$formattedDate - ${episode?.runtime} min',
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
