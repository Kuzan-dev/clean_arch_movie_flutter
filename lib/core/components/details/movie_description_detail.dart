import 'package:clean_arch_movie_flutter/core/components/details/dot_circle.dart';
import 'package:flutter/material.dart';

class MovieDescriptionDetail extends StatelessWidget {
  final dynamic movieDetails;
  const MovieDescriptionDetail({super.key, this.movieDetails});

  @override
  Widget build(BuildContext context) {
    if (movieDetails.releaseDate.isNotEmpty &&
        movieDetails.genres.isNotEmpty &&
        movieDetails.runtime!.isNotEmpty) {
      return Row(
        children: [
          if (movieDetails.releaseDate.isNotEmpty) ...[
            Text(
              movieDetails.releaseDate.split(',')[1],
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 12,
              ),
            ),
            const DotCircle(),
          ],
          if (movieDetails.genres.isNotEmpty) ...[
            Text(
              movieDetails.genres,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 12,
              ),
            ),
            const DotCircle(),
          ] else ...[
            if (movieDetails.runtime!.isNotEmpty) ...[
              const DotCircle(),
            ]
          ],
          Text(
            movieDetails.runtime!,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 12,
            ),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
