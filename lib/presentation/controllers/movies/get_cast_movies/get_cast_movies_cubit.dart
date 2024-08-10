import 'package:equatable/equatable.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';

part 'get_cast_movies_state.dart';

class GetCastMoviesCubit extends Cubit<GetCastMoviesState> {
  final MoviesUsecases _moviesUsecases;

  GetCastMoviesCubit(this._moviesUsecases) : super(GetCastMoviesInitial());

  Future<void> getCastMovies(int movieId) async {
    try {
      emit(const GetCastMoviesLoading());
      final result = await _moviesUsecases.getMovieCredits(movieId: movieId);
      result.fold(
        (error) {
          emit(GetCastMoviesError(message: error.message));
        },
        (success) {
          emit(GetCastMoviesLoaded(castMovies: success));
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
