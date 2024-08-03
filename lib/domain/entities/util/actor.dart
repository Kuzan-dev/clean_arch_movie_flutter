import 'package:clean_arch_movie_flutter/domain/entities/movies/movie_details.dart';
import 'package:equatable/equatable.dart';

class ActorDetailEntity extends Equatable {
  final int? id;
  final String? name;
  final String? birthday;
  final String? profileUrl;
  final List<MovieDetailsEntity>? movies;


  const ActorDetailEntity({
    this.name,
    this.profileUrl,
    this.birthday,
    this.id,
    this.movies,
  });

  @override
  List<Object?> get props => [
        name,
        profileUrl,
        birthday,
        id,
        movies,
      ];
}
