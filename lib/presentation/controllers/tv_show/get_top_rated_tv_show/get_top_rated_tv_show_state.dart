part of 'get_top_rated_tv_show_cubit.dart';

sealed class GetTopRatedTvShowState extends Equatable {
  const GetTopRatedTvShowState();

  @override
  List<Object> get props => [];
}

final class GetTopRatedTvShowInitial extends GetTopRatedTvShowState {}

final class GetTopRatedTvShowLoading extends GetTopRatedTvShowState {
  const GetTopRatedTvShowLoading();
}

final class GetTopRatedTvShowLoaded extends GetTopRatedTvShowState {
  const GetTopRatedTvShowLoaded({required this.tvshows});

  final List<TvShowDetailsEntity> tvshows;

  @override
  List<Object> get props => [tvshows];
}

final class GetTopRatedTvShowError extends GetTopRatedTvShowState {
  const GetTopRatedTvShowError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
