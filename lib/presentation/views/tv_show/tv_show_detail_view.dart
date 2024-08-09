import 'package:clean_arch_movie_flutter/core/components/details/movie_description_detail.dart';
import 'package:clean_arch_movie_flutter/core/components/details/details_card.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/tv_show_credit/tv_show_credit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class TvShowDetailView extends StatelessWidget {
  final int tvshowId;
  final TvShowDetailsEntity tvShowDetails;

  const TvShowDetailView(
      {super.key,
      @PathParam('tvshowId') required this.tvshowId,
      required this.tvShowDetails});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I<TvShowCreditCubit>()..getTvShowCredit(tvshowId),
      child: TvShowDetailsWidget(tvShowDetails: tvShowDetails),
    );
  }
}

class TvShowDetailsWidget extends StatelessWidget {
  const TvShowDetailsWidget({required this.tvShowDetails, super.key});

  final TvShowDetailsEntity? tvShowDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TvShowCreditCubit, TvShowCreditsState>(
        builder: (context, state) {
          if (state is TvShowCreditsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TvShowCreditsLoaded) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsCard(
                    mediaDetails: tvShowDetails,
                    detailsCard: MovieDescriptionDetail(
                      movieDetails: tvShowDetails,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is TvShowCreditsError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
