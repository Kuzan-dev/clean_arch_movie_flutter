import 'package:auto_route/auto_route.dart';
import 'package:clean_arch_movie_flutter/config/router/app_router.dart';
import 'package:clean_arch_movie_flutter/core/components/details/over_section.dart';
import 'package:clean_arch_movie_flutter/core/components/header/header_section.dart';
import 'package:flutter/material.dart';

//Función para navegar a la vista de detalles de movie/tv_show/person
void navigateToDetailsView(
  BuildContext context,
  String typeMedia,
  int id,
) {
  if (typeMedia == 'movie') {
    AutoRouter.of(context).push(MovieDetailRoute(movieId: id));
  } else if (typeMedia == 'tv_show') {
    AutoRouter.of(context).push(TvShowDetailRoute(tvshowId: id));
  } else if (typeMedia == 'person') {
  } else {
    throw Exception('Unknown type media');
  }
}

Widget buildOverSection(String? overview) {
  if (overview!.isNotEmpty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderSection(title: 'Description'),
        OverSection(overview: overview),
      ],
    );
  }
  return const SizedBox();
}
