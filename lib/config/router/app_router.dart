import 'package:auto_route/auto_route.dart';
import 'package:clean_arch_movie_flutter/core/constants/path_constants.dart';
import 'package:clean_arch_movie_flutter/presentation/views/main_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/movies/movies_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/search/search_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/watchlist/watchlist_view.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Widget,Route')
class AppRouter extends _$AppRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute(
          page: MainRoute.page,
          path: PathConstants.main,
          initial: true,
          children: [
            AdaptiveRoute(
                page: MoviesRoute.page,
                path: PathConstants.movies,
                title: (_, __) => 'Movies'),
            AdaptiveRoute(
                page: SearchRoute.page,
                path: PathConstants.search,
                title: (_, __) => 'Search'),
            AdaptiveRoute(
                page: TvShowRoute.page,
                path: PathConstants.tvShows,
                title: (_, __) => 'TV Shows'),
            AdaptiveRoute(
                page: WatchlistRoute.page,
                path: PathConstants.watchlist,
                title: (_, __) => 'Watchlist'),
          ],
        ),
      ];
}
