import 'package:equatable/equatable.dart';

abstract class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();

  @override
  List<Object?> get props => [];
}

class GetPopularMoviesEvent extends PopularMoviesEvent {}

class FetchMorePopularMoviesEvent extends PopularMoviesEvent {}