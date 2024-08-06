import 'package:auto_route/auto_route.dart';
import 'package:clean_arch_movie_flutter/presentation/views/main_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/movies/movie_navigation_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/movies/movie_detail_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/movies/movies_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/search/search_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/tv_show/tv_show_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/watchlist/watchlist_view.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Widget,Route')
class AppRouter extends _$AppRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute(
          page: MainRoute.page,
          initial: true,
          children: [
            AdaptiveRoute(page: MovieNavigationRoute.page, children: [
              CustomRoute(
                page: MoviesRoute.page,
                transitionsBuilder: TransitionsBuilders.fadeIn,
                durationInMilliseconds: 500,
              ),
              CustomRoute(
                page: MovieDetailRoute.page,
                transitionsBuilder: TransitionsBuilders.fadeIn,
                durationInMilliseconds: 500,
              ),
            ]),
            AdaptiveRoute(page: SearchRoute.page, title: (_, __) => 'Search'),
            AdaptiveRoute(page: TvShowRoute.page, title: (_, __) => 'TV Shows'),
            AdaptiveRoute(
                page: WatchlistRoute.page, title: (_, __) => 'Watchlist'),
          ],
        ),
      ];
}
