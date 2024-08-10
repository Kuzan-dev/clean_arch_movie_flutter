part of 'get_cast_movies_cubit.dart';

class GetCastMoviesState extends Equatable {
  const GetCastMoviesState();

  @override
  List<Object> get props => [];
}

class GetCastMoviesInitial extends GetCastMoviesState {}

class GetCastMoviesLoading extends GetCastMoviesState {
  const GetCastMoviesLoading();
}

class GetCastMoviesLoaded extends GetCastMoviesState {
  const GetCastMoviesLoaded({required this.castMovies});

  final MovieCreditEntity castMovies;

  @override
  List<Object> get props => [castMovies];
}

class GetCastMoviesError extends GetCastMoviesState {
  const GetCastMoviesError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
