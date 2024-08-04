import 'package:clean_arch_movie_flutter/core/database/local_database.dart';
import 'package:clean_arch_movie_flutter/data/datasources/local/collections/export_collections.dart';
import 'package:clean_arch_movie_flutter/data/datasources/local/movies/movie_local_data_source.dart';
import 'package:isar/isar.dart';
import 'package:clean_arch_movie_flutter/data/datasources/local/collections/movies/movie_details_collection.dart';

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final LocalDatabase localDatabase;

  MovieLocalDataSourceImpl(this.localDatabase);

  // Delete movie details from local database
  @override
  Future<void> deleteMovieDetails({required int? movieId}) async {
    try {
      final db = localDatabase.db;
      await db.writeTxn(() async =>
          db.movieDetailsCollections.filter().idEqualTo(movieId).deleteAll());
    } catch (_) {
      rethrow;
    }
  }

  // Get saved movie details from local database
  @override
  Future<List<MovieDetailsCollection>> getSavedMovieDetails() async {
    try {
      final list =
          await localDatabase.db.movieDetailsCollections.where().findAll();
      return list;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> saveMovieDetails(
      {required MovieDetailsCollection movieDetailsCollection}) async {
    try {
      final db = localDatabase.db;
      await db.writeTxn(
          () async => db.movieDetailsCollections.put(movieDetailsCollection));
    } catch (_) {
      rethrow;
    }
  }

  // Check if movie details is saved in local database
  @override
  Future<bool> isSavedMovieDetails({required int? movieId}) async {
    try {
      final db = localDatabase.db;
      final isSaved = await db.movieDetailsCollections
          .filter()
          .idEqualTo(movieId)
          .isNotEmpty();
      return isSaved;
    } catch (_) {
      rethrow;
    }
  }
}
