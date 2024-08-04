import 'package:isar/isar.dart';
import 'package:clean_arch_movie_flutter/core/database/local_database.dart';
import 'package:clean_arch_movie_flutter/data/datasources/local/collections/export_collections.dart';

import 'package:clean_arch_movie_flutter/data/datasources/local/tv_show/tv_show_local_data_source.dart';

class TvShowLocalDataSourceImpl implements TvShowLocalDataSource {
  TvShowLocalDataSourceImpl(this.localDatabase);

  final LocalDatabase localDatabase;

  ///Elimina los detalles de las series de televisión del local data source.

  @override
  Future<void> deleteTvShowDetails({required int tvShowId}) async {
    try {
      final db = localDatabase.db;
      await db.writeTxn(() async =>
          db.movieDetailsCollections.filter().idEqualTo(tvShowId).deleteAll());
    } catch (_) {
      rethrow;
    }
  }

  ///Guarda los detalles de las series de televisión en el local data source.

  @override
  Future<List<TvShowDetailsCollection>> getSavedTvShowDetails() async {
    try {
      final list =
          await localDatabase.db.tvShowDetailsCollections.where().findAll();
      return list;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> isTvShowSaved({required int tvShowId}) async {
    try {
      final db = localDatabase.db;
      final result = await db.tvShowDetailsCollections
          .filter()
          .idEqualTo(tvShowId)
          .isNotEmpty();
      return result;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> saveTvShowDetails(
      {required TvShowDetailsCollection tvShowDetailsCollection}) async {
    try {
      final db = localDatabase.db;
      await db.writeTxn(() async {
        db.tvShowDetailsCollections.put(tvShowDetailsCollection);
      });
    } catch (_) {
      rethrow;
    }
  }
}
