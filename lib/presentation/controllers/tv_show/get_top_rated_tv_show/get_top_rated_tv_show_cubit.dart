import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_details.dart';

part 'get_top_rated_tv_show_state.dart';

class GetTopRatedTvShowCubit extends Cubit<GetTopRatedTvShowState> {
  GetTopRatedTvShowCubit(this._movieUsecases)
      : super(GetTopRatedTvShowInitial());

  final TvShowUsecases _movieUsecases;
  final List<TvShowDetailsEntity> _movieList = [];
  int _page = 1;
  bool hasReachedMax = false;

  Future<void> getTopRatedTvShow() async {
    try {
      if (hasReachedMax) return;

      if (state is! GetTopRatedTvShowLoaded) {
        emit(const GetTopRatedTvShowLoading());
      }

      final result = await _movieUsecases.getTopRatedTvShows(page: _page);

      result.fold(
        (error) {
          emit(GetTopRatedTvShowError(message: error.message));
        },
        (success) {
          _page++;
          _movieList.addAll(success.tvShows
                  ?.where((movie) => _movieList.contains(movie) == false) ??
              []);

          if ((success.tvShows?.length ?? 0) < 20) {
            hasReachedMax = true;
          }

          emit(GetTopRatedTvShowLoaded(tvshows: List.of(_movieList)));
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
