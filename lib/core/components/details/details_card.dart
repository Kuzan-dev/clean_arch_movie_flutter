import 'package:clean_arch_movie_flutter/core/components/details/slider_card_image.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key, required this.detailsCard, this.mediaDetails});

  final Widget detailsCard;
  final dynamic mediaDetails;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        SliderCardImage(
            image:
                'https://image.tmdb.org/t/p/w780${mediaDetails.backdropUrl}'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
          ),
        )
      ],
    ));
  }
}
