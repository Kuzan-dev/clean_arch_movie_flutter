import 'package:clean_arch_movie_flutter/core/exceptions/database_exception.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/domain/entities/movies/movie_details.dart';
import 'package:clean_arch_movie_flutter/domain/entities/movies/movie_list.dart';
import 'package:fpdart/fpdart.dart';

abstract class MovieRepository {
  //Data Remota
  // Get top rated movies
  Future<Either<NetworkException, MovieListEntity>> getTopRatedMovies(
      {required int page});

  // Get popular movies
  Future<Either<NetworkException, MovieListEntity>> getPopularMovies(
      {required int page});

  // Get details of a movie
  Future<Either<NetworkException, MovieDetailsEntity>> getMovieDetails(
      {required int movieId});

  // Get similar movies
  Future<Either<NetworkException, List<MovieListEntity>>> getSimilarMovies(
      {required int movieId, required int page});

  //Data Local
  //Get favorite movies
  Future<Either<DatabaseException, List<MovieDetailsEntity>>>
      getFavoriteMovies();

  //Save a movie detail as favorite
  Future<Either<DatabaseException, void>> saveMovieDetail(
      {required MovieDetailsEntity? movieDetailsEntity});

  //Remove a movie detail from favorite
  Future<Either<DatabaseException, void>> removeMovieDetail(
      {required int? movieId});

  //Check if a movie detail is favorite
  Future<Either<DatabaseException, bool>> isFavorite({required int? movieId});
}
