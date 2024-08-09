part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchEmpty extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  const SearchLoaded({required this.result});

  final List<dynamic> result;

  @override
  List<Object> get props => [result];
}

final class SearchError extends SearchState {
  const SearchError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
