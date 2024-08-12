import 'package:clean_arch_movie_flutter/core/components/details/slider_card_image.dart';
import 'package:clean_arch_movie_flutter/core/extras/functions.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/video/video_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    Key? key,
    required this.detailsCard,
    required this.mediaDetails,
    required this.typeMedia,
  }) : super(key: key);

  final Widget detailsCard;
  final dynamic mediaDetails;
  final String typeMedia;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SliderCardImage(
          image: 'https://image.tmdb.org/t/p/w1280${mediaDetails.backdropUrl}',
        ),
        if (mediaDetails is! String) ...[
          Positioned.fill(
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => _VideoPlayerWidget(
                        id: mediaDetails.id,
                        isMovie: typeMedia == 'movie',
                      ),
                    ),
                  );
                },
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
                          mediaDetails.title ?? '',
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
                          child: detailsCard,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow,
                              size: 18,
                            ),
                            Text(
                              mediaDetails.voteAverage!.toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              ' (${mediaDetails.voteCount ?? 0} votes)',
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
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35, left: 11, right: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  navigateToHomeView(context, typeMedia);
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

class _VideoPlayerWidget extends StatefulWidget {
  final int id;
  final bool isMovie;

  const _VideoPlayerWidget({
    required this.id,
    required this.isMovie,
  });

  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  late VideoCubit _videoCubit;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _videoCubit = GetIt.I<VideoCubit>();
    _fetchData();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _videoCubit.close();
    _controller.dispose();
    super.dispose();
  }

  void _fetchData() {
    try {
      _videoCubit.getVideo(widget.id, widget.isMovie);
    } catch (e) {
      debugPrint('Error fetching video: $e');
    }
  }

  @override
  void didUpdateWidget(covariant _VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.id != widget.id) {
      _fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          BlocProvider<VideoCubit>.value(
            value: _videoCubit,
            child: BlocBuilder<VideoCubit, VideoState>(
              builder: (context, state) {
                if (state is VideoLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is VideoLoaded) {
                  _controller = YoutubePlayerController(
                    initialVideoId: state.videoEntity.key.toString(),
                    flags: const YoutubePlayerFlags(
                      mute: false,
                      autoPlay: true,
                      disableDragSeek: false,
                      loop: false,
                      isLive: false,
                      forceHD: false,
                      enableCaption: true,
                    ),
                  );
                  return YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent,
                    ),
                    onReady: () {
                      print('Player is ready.');
                    },
                  );
                } else if (state is VideoError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
