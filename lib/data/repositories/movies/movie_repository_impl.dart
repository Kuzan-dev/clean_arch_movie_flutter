import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import 'package:clean_arch_movie_flutter/core/exceptions/database_exception.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/movies/movie_repository.dart';
import 'package:clean_arch_movie_flutter/data/datasources/export_datasources.dart';
import 'package:clean_arch_movie_flutter/data/datasources/local/collections/movies/movie_details_collection.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieLocalDataSource _localDataSource;
  final MovieRemoteDataSource _remoteDataSource;

  MovieRepositoryImpl(this._localDataSource, this._remoteDataSource);

  // Remote

  @override
  Future<Either<NetworkException, MovieListEntity>> getTopRatedMovies(
      {required int page}) async {
    try {
      final result = await _remoteDataSource.getTopRatedMovies(page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, MovieListEntity>> getPopularMovies(
      {required int page}) async {
    try {
      final result = await _remoteDataSource.getPopularMovies(page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, MovieDetailsEntity>> getMovieDetails(
      {required int movieId}) async {
    try {
      final result = await _remoteDataSource.getMovieDetails(movieId: movieId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, MovieCreditEntity>> getMovieCredits(
      {required int movieId}) async {
    try {
      final result = await _remoteDataSource.getMovieCredits(movieId: movieId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, MovieListEntity>> getSimilarMovies(
      {required int movieId, required int page}) async {
    try {
      final result = await _remoteDataSource.getSimilarMovies(
          movieId: movieId, page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  // Local
  @override
  Future<Either<DatabaseException, List<MovieDetailsEntity>>>
      getFavoriteMovies() async {
    try {
      final result = await _localDataSource.getSavedMovieDetails();
      return Right(result.map((e) => e.toEntity()).toList());
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, void>> saveMovieDetails(
      {required MovieDetailsEntity? movieDetailsEntity}) async {
    try {
      final result = await _localDataSource.saveMovieDetails(
          movieDetailsCollection:
              MovieDetailsCollection().fromEntity(movieDetailsEntity));
      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, void>> removeMovieDetails(
      {required int? movieId}) async {
    try {
      final result =
          await _localDataSource.deleteMovieDetails(movieId: movieId);
      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, bool>> isFavorite(
      {required int? movieId}) async {
    try {
      final result =
          await _localDataSource.isSavedMovieDetails(movieId: movieId);
      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }
}
