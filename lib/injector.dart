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

    // Registra TvShowUsecases
    ..registerLazySingleton<TvShowRepository>(
        () => TvShowRepositoryImpl(injector(), injector()))
    ..registerLazySingleton<TvShowUsecases>(() => TvShowUsecases(injector()))

    // Bloc
    ..registerLazySingleton<PopularTvShowCubit>(
        () => PopularTvShowCubit(injector<TvShowUsecases>()))
    ..registerLazySingleton<TopRatedTvShowCubit>(
        () => TopRatedTvShowCubit(injector<TvShowUsecases>()))
    ..registerLazySingleton<TvShowCreditCubit>(
        () => TvShowCreditCubit(injector<TvShowUsecases>()));
}
