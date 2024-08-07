import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_details.dart';

part 'get_popular_tv_show_state.dart';

class GetPopularTvShowCubit extends Cubit<GetPopularTvShowState> {
  GetPopularTvShowCubit(this._movieUsecases) : super(GetPopularTvShowInitial());

  /// The list of popular movie details.
  final List<TvShowDetailsEntity> _movieList = [];

  /// The current page number for fetching popular movies.
  int _page = 1;

  /// A flag indicating whether the maximum number of movies has been reached.
  bool hasReachedMax = false;

  Future<void> getPopularTvShow() async {
    try {
      // Checks if the maximum limit has been reached.
      if (hasReachedMax) return;

      /// Checks if the current state is not [GetPopularMoviesLoaded].
      /// If it is not, emits a [GetPopularMoviesLoading] state.
      if (state is! GetPopularTvShowLoaded) {
        emit(const GetPopularTvShowLoading());
      }

      final result = await _movieUsecases.getPopularTvShows(page: _page);

      result.fold(
        (error) => emit(GetPopularTvShowError(message: error.message)),
        (success) {
          // Increases the page number and adds the movies from the [success] response to the movie list.
          // If a movie already exists in the movie list, it will not be added again.
          // If the number of movies in the [success] response is less than 20, sets [hasReachedMax] to true.
          // Emits a [GetPopularMoviesLoaded] state with the updated movie list.

          _page++;
          _movieList.addAll(success.tvShows
                  ?.where((movie) => _movieList.contains(movie) == false) ??
              []);

          /// Checks if the number of movies in the [success] response is less than 20.
          /// If so, sets [hasReachedMax] to true.
          if ((success.tvShows?.length ?? 0) < 20) {
            hasReachedMax = true;
          }

          emit(GetPopularTvShowLoaded(tvshows: List.of(_movieList)));
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  final TvShowUsecases _movieUsecases;
}
