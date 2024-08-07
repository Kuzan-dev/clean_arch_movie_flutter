import 'dart:async';
import 'package:clean_arch_movie_flutter/core/extras/enums.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/movies/movies_usecases.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/movies/movie_popular_bloc/movie_popular_event.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/movies/movie_popular_bloc/movie_popular_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent,PopularMoviesState> {
  final MoviesUsecases moviesUsecases;

  PopularMoviesBloc(this.moviesUsecases)
  : super(PopularMoviesState()){
    on<GetPopularMoviesEvent>(_getAllMovies);
    on<FetchMorePopularMoviesEvent>(_fetchMoreMovies);
  }

  int page = 1;

  Future<void> _getAllMovies(GetPopularMoviesEvent event, Emitter<PopularMoviesState> emit) async {
    if (state.status == GetAllRequestStatus.loading) {
      await _getMovies(emit);
    } else if (state.status == GetAllRequestStatus.loaded) {
      await _getMovies(emit);
    } else {
      emit(
        state.copyWith(
          status: GetAllRequestStatus.loading,
        ),
      );
      await _getMovies(emit);
    }
  }

  Future<void> _getMovies(Emitter<PopularMoviesState> emit) async {
    final result = await moviesUsecases.getPopularMovies(page: page);
    result.fold(
      (l) => emit(
        state.copyWith(
          status: GetAllRequestStatus.error,
        ),
      ),
      (r) {
        page ++;
        emit(
          state.copyWith(
            status: GetAllRequestStatus.loaded,
            movieList: r,
          ),
        );
      }
    );
  }

  Future<void> _fetchMoreMovies(FetchMorePopularMoviesEvent event, Emitter<PopularMoviesState> emit) async {
    final result = await moviesUsecases.getPopularMovies(page: page);
    result.fold(
      (l) => emit(
        state.copyWith(
          status: GetAllRequestStatus.error,
        ),
      ),
      (r) {
        page ++;
        return emit(
          state.copyWith(
            status: GetAllRequestStatus.loaded,
            movieList: MovieListEntity(
              page: r.page,
              movies: List.of(state.movieList.movies!)..addAll(r.movies!),
              totalPages: r.totalPages,
              totalResults: r.totalResults,
            ),
          ),
        );
      }
    );
  }

}