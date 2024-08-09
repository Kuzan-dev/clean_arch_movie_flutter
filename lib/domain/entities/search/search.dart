import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable{
  final int? id;
  final String? title;
  final String? posterUrl;
  final bool? isMovie;

  const SearchEntity({
    this.id,
    this.title,
    this.posterUrl,
    this.isMovie,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    posterUrl,
    isMovie,
  ];
}