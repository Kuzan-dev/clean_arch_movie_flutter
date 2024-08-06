
import 'package:auto_route/auto_route.dart';
import 'package:clean_arch_movie_flutter/config/router/app_router.dart';
import 'package:flutter/material.dart';

//Función para navegar a la vista de detalles de movie/tv_show/person
void navigateToDetailsView(BuildContext context, String typeMedia, int id) {
  if (typeMedia == 'movie') {
    context.router.push(
      MovieDetailRoute(movieId: id),
    );
  } else if (typeMedia == 'tv_show') {

  } else if (typeMedia == 'person') {

  } else {
    throw Exception('Unknown type media');
  }
}


