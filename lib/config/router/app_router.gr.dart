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
    MovieNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MovieNavigationView(),
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
    TvShowDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TvShowDetailRouteArgs>(
          orElse: () =>
              TvShowDetailRouteArgs(tvshowId: pathParams.getInt('tvshowId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvShowDetailView(
          key: args.key,
          tvshowId: args.tvshowId,
        ),
      );
    },
    TvShowNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvShowNavigationView(),
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
/// [MovieNavigationView]
class MovieNavigationRoute extends PageRouteInfo<void> {
  const MovieNavigationRoute({List<PageRouteInfo>? children})
      : super(
          MovieNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [TvShowDetailView]
class TvShowDetailRoute extends PageRouteInfo<TvShowDetailRouteArgs> {
  TvShowDetailRoute({
    Key? key,
    required int tvshowId,
    List<PageRouteInfo>? children,
  }) : super(
          TvShowDetailRoute.name,
          args: TvShowDetailRouteArgs(
            key: key,
            tvshowId: tvshowId,
          ),
          rawPathParams: {'tvshowId': tvshowId},
          initialChildren: children,
        );

  static const String name = 'TvShowDetailRoute';

  static const PageInfo<TvShowDetailRouteArgs> page =
      PageInfo<TvShowDetailRouteArgs>(name);
}

class TvShowDetailRouteArgs {
  const TvShowDetailRouteArgs({
    this.key,
    required this.tvshowId,
  });

  final Key? key;

  final int tvshowId;

  @override
  String toString() {
    return 'TvShowDetailRouteArgs{key: $key, tvshowId: $tvshowId}';
  }
}

/// generated route for
/// [TvShowNavigationView]
class TvShowNavigationRoute extends PageRouteInfo<void> {
  const TvShowNavigationRoute({List<PageRouteInfo>? children})
      : super(
          TvShowNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvShowNavigationRoute';

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
