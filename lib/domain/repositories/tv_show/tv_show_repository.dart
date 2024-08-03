import 'package:clean_arch_movie_flutter/core/exceptions/database_exception.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/episode_details.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/episode_list.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/season_details.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_credit.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_details.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_list.dart';
import 'package:fpdart/fpdart.dart';

abstract class TvShowRepository {
  //* Fuente de datos remota
  /// Recupera las series mejor valoradas del servidor.
  Future<Either<NetworkException, TvShowListEntity>> getTopRatedTvShows(
      int page);

  /// Recupera las series populares del servidor.
  Future<Either<NetworkException, TvShowListEntity>> getPopularTvShows(
      int page);

  /// Recupera los créditos de una película específica del servidor.
  Future<Either<NetworkException, TvShowCreditEntity>> getTvShowCredit(
      int tvShowId);

  /// Recupera los detalles de una season de una serie específica del servidor.
  Future<Either<NetworkException, SeasonDetailsEntity>> getSeasonDetails(
      int tvShowId, int seasonNumber);

  /// Recupera la lista de episodios de una serie específica del servidor.
  Future<Either<NetworkException, EpisodeDetailEntity>> getEpisodeList(
      int tvShowId, int seasonNumber);

  ///  Recupera la lista de episodios de una serie específica del servidor.
  Future<Either<NetworkException, EpisodeListEntity>> getEpisodeDetails(
      int tvShowId, int seasonNumber, int episodeNumber);

  /// Recupera las series de televisión que se parecen a una serie específica del servidor.
  Future<Either<NetworkException, TvShowListEntity>> getSimilarTvShows(
      int tvShowId, int page);

  //* Local Data Source
  /// Recupera los detalles de la película guardada de la base de datos.
  Future<Either<DatabaseException, List<TvShowDetailsEntity>>>
      getSavedMovieDetails();

  /// Guarda los detalles de la película en la base de datos.
  Future<Either<DatabaseException, void>> saveTvShowDetails(
      {required TvShowDetailsEntity? tvShowDetails});

  /// Elimina los detalles de la película de la base de datos.
  Future<Either<DatabaseException, void>> deleteTvShowDetails(
      {required int tvShowId});

  /// Verifica si la película está guardada en la base de datos.
  Future<Either<DatabaseException, bool>> isTvShowSaved(
      {required int tvShowId});
}
