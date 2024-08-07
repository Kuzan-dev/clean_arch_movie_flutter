part of 'get_popular_tv_show_cubit.dart';

sealed class GetPopularTvShowState extends Equatable {
  const GetPopularTvShowState();

  @override
  List<Object> get props => [];
}

final class GetPopularTvShowInitial extends GetPopularTvShowState {}

final class GetPopularTvShowLoading extends GetPopularTvShowState {
  const GetPopularTvShowLoading();
}

final class GetPopularTvShowLoaded extends GetPopularTvShowState {
  const GetPopularTvShowLoaded({required this.tvshows});

  final List<TvShowDetailsEntity> tvshows;

  @override
  List<Object> get props => [tvshows];
}

final class GetPopularTvShowError extends GetPopularTvShowState {
  const GetPopularTvShowError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
