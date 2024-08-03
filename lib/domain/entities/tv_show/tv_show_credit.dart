import 'package:equatable/equatable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/cast.dart';

class TvShowCreditEntity extends Equatable {
  final int? id;
  final List<CastEntity>? cast;

  const TvShowCreditEntity({
    this.id,
    this.cast,
  });

  @override
  List<Object?> get props => [
        id,
        cast,
      ];
}
