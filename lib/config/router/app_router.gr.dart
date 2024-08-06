// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainView(),
      );
    },
    MovieDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MovieDetailRouteArgs>(
          orElse: () =>
              MovieDetailRouteArgs(movieId: pathParams.getInt('movieId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MovieDetailView(
          key: args.key,
          movieId: args.movieId,
        ),
      );
    },
    MoviesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MoviesView(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchView(),
      );
    },
    TvShowRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvShowView(),
      );
    },
    WatchlistRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WatchlistView(),
      );
    },
  };
}

/// generated route for
/// [MainView]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieDetailView]
class MovieDetailRoute extends PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    Key? key,
    required int movieId,
    List<PageRouteInfo>? children,
  }) : super(
          MovieDetailRoute.name,
          args: MovieDetailRouteArgs(
            key: key,
            movieId: movieId,
          ),
          rawPathParams: {'movieId': movieId},
          initialChildren: children,
        );

  static const String name = 'MovieDetailRoute';

  static const PageInfo<MovieDetailRouteArgs> page =
      PageInfo<MovieDetailRouteArgs>(name);
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({
    this.key,
    required this.movieId,
  });

  final Key? key;

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{key: $key, movieId: $movieId}';
  }
}

/// generated route for
/// [MoviesView]
class MoviesRoute extends PageRouteInfo<void> {
  const MoviesRoute({List<PageRouteInfo>? children})
      : super(
          MoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoviesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchView]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvShowView]
class TvShowRoute extends PageRouteInfo<void> {
  const TvShowRoute({List<PageRouteInfo>? children})
      : super(
          TvShowRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvShowRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WatchlistView]
class WatchlistRoute extends PageRouteInfo<void> {
  const WatchlistRoute({List<PageRouteInfo>? children})
      : super(
          WatchlistRoute.name,
          initialChildren: children,
        );

  static const String name = 'WatchlistRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
