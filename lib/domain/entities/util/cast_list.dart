import 'package:clean_arch_movie_flutter/domain/entities/util/cast.dart';
import 'package:equatable/equatable.dart';

class CastListEntity extends Equatable {
  final int? id;
  final List<CastEntity> cast;

  const CastListEntity({
    this.id,
    required this.cast,
  });

  @override
  List<Object?> get props => [id, cast];
}