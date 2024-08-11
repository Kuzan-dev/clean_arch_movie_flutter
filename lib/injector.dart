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
    ..registerLazySingleton<SearchRemoteDataSource>(
        () => SearchRemoteDataSourceImpl(injector()))

    // Registra TvShowUsecases
    ..registerLazySingleton<TvShowRepository>(
        () => TvShowRepositoryImpl(injector(), injector()))
    ..registerLazySingleton<TvShowUsecases>(() => TvShowUsecases(injector()))

    // Registra MovieUsecases
    ..registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(injector(), injector()))
    ..registerLazySingleton<MoviesUsecases>(() => MoviesUsecases(injector()))

    // Registra SearchUsecases
    ..registerLazySingleton<SearchRepository>(
        () => SearchRepositoryImpl(injector()))
    ..registerLazySingleton<SearchUsecases>(() => SearchUsecases(injector()))

    // Bloc TvShows

    // Bloc Movies
    ..registerLazySingleton<GetPopularMoviesCubit>(
        () => GetPopularMoviesCubit(injector<MoviesUsecases>()))
    ..registerLazySingleton<GetTopRatedMoviesCubit>(
        () => GetTopRatedMoviesCubit(injector<MoviesUsecases>()))
    ..registerLazySingleton<GetDetailsMoviesCubit>(
        () => GetDetailsMoviesCubit(injector<MoviesUsecases>()))
    ..registerLazySingleton<GetCreditMoviesCubit>(
        () => GetCreditMoviesCubit(injector<MoviesUsecases>()))
    ..registerLazySingleton<GetSimilarMoviesCubit>(
        () => GetSimilarMoviesCubit(injector<MoviesUsecases>()))
    // Bloc Search
    ..registerLazySingleton<SearchCubit>(
        () => SearchCubit(injector<SearchUsecases>()))
    // Bloc
    ..registerLazySingleton<PopularTvShowCubit>(
        () => PopularTvShowCubit(injector<TvShowUsecases>()))
    ..registerLazySingleton<TopRatedTvShowCubit>(
        () => TopRatedTvShowCubit(injector<TvShowUsecases>()))
    ..registerLazySingleton<TvShowCreditCubit>(
        () => TvShowCreditCubit(injector<TvShowUsecases>()))
    ..registerLazySingleton<TvShowDetailsCubit>(
        () => TvShowDetailsCubit(injector<TvShowUsecases>()))
    ..registerLazySingleton<TvShowSeasonDetailsCubit>(
        () => TvShowSeasonDetailsCubit(injector<TvShowUsecases>()));
}
