import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/actor.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/actor_movies.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/cast.dart';
import 'package:fpdart/fpdart.dart';

abstract class UtilRepository {
  //Data Remota
  // Get cast of a movie or tv show
  Future<Either<NetworkException, List<CastEntity>>> getCast({required int id});

  // Get actor details
  Future<Either<NetworkException, ActorDetailEntity>> getActorDetails(
      {required int id});

  // Get actor movies
  Future<Either<NetworkException, List<ActorMovieEntity>>> getActorMovies(
      {required int id});
}
