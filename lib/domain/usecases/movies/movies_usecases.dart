import 'package:clean_arch_movie_flutter/domain/repositories/movies/movie_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/database_exception.dart';

abstract class MoviesUsecases {
  final MovieRepository _repository;

  MoviesUsecases(this._repository);

  //* Fuente de datos remota

  // Recupera las películas mejor valoradas del servidor.
  Future<Either<NetworkException, MovieListEntity>> getTopRatedMovies(
      {required int page}) async {
    return _repository.getTopRatedMovies(page: page);
  }

  // Recupera las películas populares del servidor.
  Future<Either<NetworkException, MovieListEntity>> getPopularMovies(
      {required int page}) async {
    return _repository.getPopularMovies(page: page);
  }

  // Recupera los detalles de una película específica del servidor.
  Future<Either<NetworkException, MovieDetailsEntity>> getMovieDetails(
      {required int movieId}) async {
    return _repository.getMovieDetails(movieId: movieId);
  }

  // Recupera las películas similares a una película específica del servidor.
  Future<Either<NetworkException, MovieListEntity>> getSimilarMovies(
      {required int movieId, required int page}) async {
    return _repository.getSimilarMovies(movieId: movieId, page: page);
  }

  //* Fuente de datos local
  Future<Either<DatabaseException, List<MovieDetailsEntity>>>
      getFavoriteMovies() async {
    return _repository.getFavoriteMovies();
  }

  //Este método alterna el marcador de una película en la fuente de datos local.

  Future<Either<DatabaseException, void>> toggleFavoriteMovie(
      {required MovieDetailsEntity? movieDetailsEntity}) async {
    final isSaved =
        await _repository.isFavorite(movieId: movieDetailsEntity?.id);

    return isSaved.fold((error) {
      return left(error);
    }, (isSaved) {
      if (isSaved) {
        return _repository.removeMovieDetails(movieId: movieDetailsEntity?.id);
      } else {
        return _repository.saveMovieDetails(
            movieDetailsEntity: movieDetailsEntity);
      }
    });
  }
}
