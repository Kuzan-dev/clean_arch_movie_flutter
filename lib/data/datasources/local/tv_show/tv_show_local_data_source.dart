import 'package:clean_arch_movie_flutter/data/datasources/local/collections/tv_show/tv_show_detail_collection.dart';

abstract class TvShowLocalDataSource {
  const TvShowLocalDataSource();

  ///Guarda los detalles de las series de televisión en el local data source.
  Future<void> saveTvShowDetails(
      {required TvShowDetailsCollection tvShowDetailsCollection});

  ///Elimina los detalles de las series de televisión del local data source.
  Future<void> deleteTvShowDetails({required int tvShowId});

  ///Verifica si la serie de televisión está guardada en el local data source.

  Future<bool> isTvShowSaved({required int tvShowId});

  ///Recupera la lista de series de televisión guardadas en el local data source.
  Future<List<TvShowDetailsCollection>> getSavedTvShowDetails();
}
