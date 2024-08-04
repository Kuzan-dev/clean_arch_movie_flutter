import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/database_exception.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/tv_show/tv_show_repository.dart';
import 'package:clean_arch_movie_flutter/data/datasources/export_datasources.dart';
import 'package:clean_arch_movie_flutter/data/datasources/local/collections/tv_show/tv_show_detail_collection.dart';

class TvShowRepositoryImpl implements TvShowRepository {
  final TvShowLocalDataSource _localDataSource;
  final TvShowRemoteDataSource _remoteDataSource;

  TvShowRepositoryImpl(this._localDataSource, this._remoteDataSource);

  // Remote

  @override
  Future<Either<NetworkException, TvShowListEntity>> getTopRatedTvShows(
      {required int page}) async {
    try {
      final result = await _remoteDataSource.getTopRatedTvShows(page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, TvShowListEntity>> getPopularTvShows(
      {required int page}) async {
    try {
      final result = await _remoteDataSource.getPopularTvShows(page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, TvShowDetailsEntity>> getTvShowDetails(
      {required int tvShowId}) async {
    try {
      final result =
          await _remoteDataSource.getTvShowDetails(tvShowId: tvShowId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, TvShowCreditEntity>> getTvShowCredit(
      {required int tvShowId}) async {
    try {
      final result =
          await _remoteDataSource.getTvShowCredit(tvShowId: tvShowId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, TvShowListEntity>> getSimilarTvShows(
      {required int tvShowId, required int page}) async {
    try {
      final result = await _remoteDataSource.getSimilarTvShows(
          tvShowId: tvShowId, page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, SeasonDetailsEntity>> getSeasonDetails(
      {required int tvShowId, required int seasonNumber}) async {
    try {
      final result = await _remoteDataSource.getSeasonDetails(
          tvShowId: tvShowId, seasonNumber: seasonNumber);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, EpisodeDetailEntity>> getEpisodeDetails(
      {required int tvShowId,
      required int seasonNumber,
      required int episodeNumber}) async {
    try {
      final result = await _remoteDataSource.getEpisodeDetails(
          tvShowId: tvShowId,
          seasonNumber: seasonNumber,
          episodeNumber: episodeNumber);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  // Local

  @override
  Future<Either<DatabaseException, List<TvShowDetailsEntity>>>
      getSavedTvShowDetails() async {
    try {
      final result = await _localDataSource.getSavedTvShowDetails();
      return Right(result.map((e) => e.toEntity()).toList());
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, void>> saveTvShowDetails(
      {required TvShowDetailsEntity? tvShowDetails}) async {
    try {
      final result = await _localDataSource.saveTvShowDetails(
        tvShowDetailsCollection:
            TvShowDetailsCollection().fromEntity(tvShowDetails),
      );

      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, void>> deleteTvShowDetails(
      {required int tvShowId}) async {
    try {
      final result =
          await _localDataSource.deleteTvShowDetails(tvShowId: tvShowId);
      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, bool>> isTvShowSaved(
      {required int tvShowId}) async {
    try {
      final result = await _localDataSource.isTvShowSaved(tvShowId: tvShowId);
      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }
}
