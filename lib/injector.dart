part of '../main.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector

    //* Network
    ..registerLazySingleton<DioClient>(DioClient.new)
    ..registerLazySingleton<LocalDatabase>(LocalDatabase.new)
    ..registerLazySingleton<TvShowRemoteDataSource>(
        () => TvShowRemoteDataSourceImpl(injector()))
    ..registerLazySingleton<TvShowLocalDataSource>(
        () => TvShowLocalDataSourceImpl(injector<LocalDatabase>()))
    ..registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl(injector()))
    ..registerLazySingleton<MovieLocalDataSource>(
        () => MovieLocalDataSourceImpl(injector<LocalDatabase>()))

    // Registra TvShowUsecases
    ..registerLazySingleton<TvShowRepository>(
        () => TvShowRepositoryImpl(injector(), injector()))
    ..registerLazySingleton<TvShowUsecases>(() => TvShowUsecases(injector()))

    // Registra MovieUsecases
    ..registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(injector(), injector()))
    ..registerLazySingleton<MoviesUsecases>(() => MoviesUsecases(injector()))

    // Bloc TvShows
    ..registerLazySingleton<GetPopularTvShowCubit>(
        () => GetPopularTvShowCubit(injector<TvShowUsecases>()))
    ..registerLazySingleton<GetTopRatedTvShowCubit>(
        () => GetTopRatedTvShowCubit(injector<TvShowUsecases>()))
    // Bloc Movies
    ..registerLazySingleton<GetPopularMoviesCubit>(
        () => GetPopularMoviesCubit(injector<MoviesUsecases>()))
    ..registerLazySingleton<GetTopRatedMoviesCubit>(
        () => GetTopRatedMoviesCubit(injector<MoviesUsecases>()));
}
