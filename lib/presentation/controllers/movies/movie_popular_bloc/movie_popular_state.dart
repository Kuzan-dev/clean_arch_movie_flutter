import 'package:clean_arch_movie_flutter/core/extras/enums.dart';
import 'package:clean_arch_movie_flutter/domain/entities/movies/movie_list.dart';
import 'package:equatable/equatable.dart';

class PopularMoviesState extends Equatable{
  final MovieListEntity movieList;
  final GetAllRequestStatus status;
  final String message;

  const PopularMoviesState({
    this.movieList = const MovieListEntity(),
    this.status = GetAllRequestStatus.loading,
    this.message = '',
  });

  PopularMoviesState copyWith({
    MovieListEntity? movieList,
    GetAllRequestStatus? status,
    String? message,
  }){
    return PopularMoviesState(
      movieList: movieList ?? this.movieList,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
    movieList,
    status,
    message,
  ];
}

