import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/search/search.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_model.g.dart';

@JsonSerializable()
class SearchModel extends Equatable with EntityConvertible<SearchModel, SearchEntity> {
  final int? id;
  @JsonKey(fromJson: _titleFromJson)
  final String? title;
  @JsonKey(name: 'poster_path')
  final String? posterUrl;
  @JsonKey(name: 'media_type', fromJson: _isMovieFromJson)
  final bool? isMovie;

  const SearchModel({
    this.id,
    this.title,
    this.posterUrl,
    this.isMovie,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return _$SearchModelFromJson(json);
  }

  @override
  SearchEntity toEntity() => SearchEntity(
        id: id,
        title: title,
        posterUrl: posterUrl,
        isMovie: isMovie,
      );
  
  Map<String, dynamic> toJson() => _$SearchModelToJson(this);

  @override
  List<Object?> get props => [id, title, posterUrl, isMovie];



  static String? _titleFromJson(Map<String, dynamic> json) {
    return json['title'] ?? json['name'];
  }

  static bool? _isMovieFromJson(String? mediaType) {
    if (mediaType == null) return null;
    return mediaType == 'movie';
  }
}