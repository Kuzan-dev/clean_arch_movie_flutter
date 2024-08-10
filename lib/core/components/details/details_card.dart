import 'package:clean_arch_movie_flutter/core/components/details/slider_card_image.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key, required this.detailsCard, this.mediaDetails});

  final Widget detailsCard;
  final dynamic mediaDetails;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SliderCardImage(
            image:
                'https://image.tmdb.org/t/p/w1280${mediaDetails.backdropUrl}'),
        if (mediaDetails is! String) ...[
          Positioned.fill(
            child: Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            mediaDetails.title,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                bottom: 6,
                              ),
                              child: detailsCard),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rate_rounded,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Text(
                                mediaDetails.voteAverage.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ' (${mediaDetails.voteCount} votes)',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35, left: 11, right: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.bookmark_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
