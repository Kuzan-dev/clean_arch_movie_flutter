import 'package:chewie/chewie.dart';
import 'package:clean_arch_movie_flutter/core/components/details/slider_card_image.dart';
import 'package:clean_arch_movie_flutter/core/extras/functions.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/video/video_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard(
      {super.key,
      required this.detailsCard,
      required this.mediaDetails,
      required this.typeMedia});
  final Widget detailsCard;
  final dynamic mediaDetails;
  final String typeMedia;

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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => _VideoPlayerWidget(
                            id: mediaDetails.id,
                            isMovie: typeMedia == 'movie')),
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
                              child: detailsCard),
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
              )),
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

  const _VideoPlayerWidget({required this.id, required this.isMovie});

  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  late VideoCubit _videoCubit;
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late Future<void> _initializeVideoPlayerFuture;
  double videoContainerRatio = 0.5;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse('https://youtube.com/watch?v=${widget.id}'));
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _videoPlayerController.setVolume(1.0);
    _videoCubit = GetIt.I<VideoCubit>();
    _fetchData();
  }

  @override
  void dispose() {
    _videoCubit.close();
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  void _fetchData() {
  try {
    _videoCubit.getVideo(widget.id, widget.isMovie);
  } catch (e) {
    print('Error fetching video: $e');
  }
}

  double getScale() {
    double videoRatio = _videoPlayerController.value.aspectRatio;
    if (videoRatio < videoContainerRatio) {
      ///for tall videos, we just return the inverse of the controller aspect ratio
      return videoContainerRatio / videoRatio;
    } else {
      ///for wide videos, divide the video AR by the fixed container AR
      ///so that the video does not over scale
      return videoRatio / videoContainerRatio;
    }
  }

  void toggleVideoPlayback() {
    if (_videoPlayerController.value.isPlaying) {
      _chewieController.pause();
    } else {
      _chewieController.play();
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
                  return FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        _chewieController = ChewieController(
                          videoPlayerController: _videoPlayerController,
                          aspectRatio: _videoPlayerController.value.aspectRatio,
                          autoPlay: true,
                          looping: true,
                          allowFullScreen: true,
                          allowMuting: false,
                          showControls: true,
                          deviceOrientationsAfterFullScreen: [
                            DeviceOrientation.portraitUp,
                            DeviceOrientation.portraitDown,
                          ],
                        );
                        return Container(
                          child: Transform.scale(
                            scale: getScale(),
                            child: AspectRatio(
                              aspectRatio:
                                  _videoPlayerController.value.aspectRatio,
                              child: Stack(
                                children: [
                                  Chewie(
                                    controller: _chewieController,
                                  ),
                                  GestureDetector(
                                    onTap: toggleVideoPlayback,
                                    behavior: HitTestBehavior.opaque,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
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
