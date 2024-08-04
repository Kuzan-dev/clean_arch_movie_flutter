import 'package:clean_arch_movie_flutter/data/models/tv_show/episode_details_model.dart';
import 'package:clean_arch_movie_flutter/data/models/tv_show/episode_list_model.dart';
import 'package:clean_arch_movie_flutter/data/models/tv_show/season_details_model.dart';
import 'package:clean_arch_movie_flutter/data/models/tv_show/tv_show_credit_model.dart';
import 'package:clean_arch_movie_flutter/data/models/tv_show/tv_show_list_model.dart';

abstract class TvShowRemoteDataSource {
  //* Fuente de datos remota
  /// Devuelve una lista de series de televisión mejor valoradas de la fuerente de datos remota.
  Future<TvShowListModel> getTopRatedTvShows(int page);

  /// Devuelve una lista de series de televisión populares de la fuente de datos remota.
  Future<TvShowListModel> getPopularTvShows(int page);

  /// Devuelve los créditos de una serie de televisión específica de la fuente de datos remota.
  Future<TvShowCreditModel> getTvShowCredit(int tvShowId);

  /// Devuelve los detalles de una temporada de una serie de televisión específica de la fuente de datos remota.
  Future<SeasonDetailsModel> getSeasonDetails(int tvShowId, int seasonNumber);

  /// Devuelve la lista de episodios de una serie de televisión específica de la fuente de datos remota.
  Future<EpisodeDetailsModel> getEpisodeList(int tvShowId, int seasonNumber);

  ///  Devuelve los detalles de un episodio de una serie de televisión específica de la fuente de datos remota.
  Future<EpisodeListModel> getEpisodeDetails(
      int tvShowId, int seasonNumber, int episodeNumber);

  /// Devuelve una lista de series de televisión similares a una serie de televisión específica de la fuente de datos remota.
  Future<TvShowListModel> getSimilarTvShows(int tvShowId, int page);
}
