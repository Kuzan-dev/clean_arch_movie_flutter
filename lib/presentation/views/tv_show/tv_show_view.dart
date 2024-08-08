import 'package:clean_arch_movie_flutter/core/components/carrousell/carrousell_card.dart';
import 'package:clean_arch_movie_flutter/core/components/carrousell/section_listview_card.dart';
import 'package:clean_arch_movie_flutter/core/components/header/header_title.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/get_popular_tv_show/get_popular_tv_show_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/get_top_rated_tv_show/get_top_rated_tv_show_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:clean_arch_movie_flutter/core/components/slider/slider_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TvShowView extends StatelessWidget {
  const TvShowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<GetPopularTvShowCubit, GetPopularTvShowState>(
            listener: (context, state) {
              if (state is GetPopularTvShowError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
          BlocListener<GetTopRatedTvShowCubit, GetTopRatedTvShowState>(
            listener: (context, state) {
              if (state is GetTopRatedTvShowError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<GetPopularTvShowCubit, GetPopularTvShowState>(
          builder: (context, popularState) {
            return BlocBuilder<GetTopRatedTvShowCubit, GetTopRatedTvShowState>(
              builder: (context, topRatedState) {
                if (popularState is GetPopularTvShowLoading ||
                    topRatedState is GetTopRatedTvShowLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (popularState is GetPopularTvShowLoaded &&
                    topRatedState is GetTopRatedTvShowLoaded) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SliderCard(
                          mediaType: 'tv_show',
                          list: popularState.tvshows,
                          index: 0,
                        ),
                        HeaderTitle(
                          title: 'Popular TV Shows',
                          onTap: () {},
                        ),
                        CarrousellCard(
                          height: 250,
                          intemCount: popularState.tvshows.length,
                          itemBuilder: (context, index) {
                            return SectionListViewCard(
                              media: popularState.tvshows[index],
                            );
                          },
                        ),
                        HeaderTitle(
                          title: 'Top Rated TV Shows',
                          onTap: () {},
                        ),
                        CarrousellCard(
                          height: 250,
                          intemCount: topRatedState.tvshows.length,
                          itemBuilder: (context, index) {
                            return SectionListViewCard(
                              media: topRatedState.tvshows[index],
                            );
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('An error occurred'),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
