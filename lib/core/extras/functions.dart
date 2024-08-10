import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:clean_arch_movie_flutter/config/router/app_router.dart';
import 'package:clean_arch_movie_flutter/core/components/details/over_section.dart';
import 'package:clean_arch_movie_flutter/core/components/header/header_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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

void navigateToSectionView(BuildContext context, String title, String typeMedia,
    List<dynamic> listDetails) {
  if (typeMedia == 'movie') {
    if (title == 'Top Rated') {
      AutoRouter.of(context).push(MovieTopRatedRoute(listData: listDetails));
    } else if (title == 'Popular') {
      AutoRouter.of(context).push(MoviePopularRoute(listData: listDetails));
    } else {
      throw Exception('Unknown title');
    }
  } else if (typeMedia == 'tv_show') {
    //AutoRouter.of(context).push(TvShowSectionRoute(sectionId: id));
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

String formattedDate(String date) {
  if (date.isNotEmpty) {
    final DateTime dateTime = DateTime.parse(date);
    final String formattedDate = DateFormat('MMM dd yyyy').format(dateTime);
    return formattedDate;
  }
  return '';
}

void bottomSheetShow(BuildContext context, Widget child) {
  showCupertinoModalBottomSheet(
    expand: false,
    isDismissible: false,
    context: context,
    animationCurve: Curves.easeInOut,
    elevation: 0.5,
    backgroundColor: Colors.black87,
    barrierColor:
        Colors.black.withOpacity(0.5), // Añade una sombra detrás del modal
    builder: (context) => ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(70)),
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 10, sigmaY: 10), // Aplica el desenfoque
            child: Container(
              color: Colors.black
                  .withOpacity(0.5), // Ajusta el color de fondo con opacidad
            ),
          ),
          FractionallySizedBox(
            heightFactor: 1,
            child: child,
          ),
        ],
      ),
    ),
  );
}
