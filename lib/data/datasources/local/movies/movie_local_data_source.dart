import 'package:clean_arch_movie_flutter/data/datasources/local/collections/movies/movie_details_collection.dart';

abstract class MovieLocalDataSource {
  const MovieLocalDataSource();
  // Save movie details to local database
  Future<void> saveMovieDetails(
      {required MovieDetailsCollection movieDetailsCollection});
  // Delete movie details from local database
  Future<void> deleteMovieDetails({required int? movieId});
  // Check if movie details is saved in local database
  Future<bool> isSavedMovieDetails({required int? movieId});
  // Get saved movie details from local database
  Future<List<MovieDetailsCollection>> getSavedMovieDetails();
}
