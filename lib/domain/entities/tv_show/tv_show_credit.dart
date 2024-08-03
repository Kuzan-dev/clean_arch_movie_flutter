import 'package:equatable/equatable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/cast.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/review.dart';

class TvShowCreditEntity extends Equatable {
  final int? id;
  final List<CastEntity>? cast;
  final List<ReviewEntity>? reviews;

  const TvShowCreditEntity({
    this.id,
    this.cast,
    this.reviews,
  });

  @override
  List<Object?> get props => [
        id,
        cast,
        reviews,
      ];
}
