import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/get_popular_tv_show/get_popular_tv_show_cubit.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<GetPopularTvShowCubit, GetPopularTvShowState>(
              builder: (context, state) {
                if (state is GetPopularTvShowLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetPopularTvShowLoaded) {
                  print(state.tvshows);
                  return SliderCard(
                    mediaType: 'tv_show',
                    list: state.tvshows,
                    index: 0,
                  );
                } else if (state is GetPopularTvShowError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
