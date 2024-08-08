// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsModel _$MovieDetailsModelFromJson(Map<String, dynamic> json) =>
    MovieDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      posterUrl: json['poster_path'] as String?,
      backdropUrl: json['backdrop_path'] as String?,
      releaseDate: json['release_date'] as String?,
      genres: (json['genres_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      runtime: json['runtime'] as String?,
      overview: json['overview'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      trailerUrl: json['trailer_url'] as String?,
    );

Map<String, dynamic> _$MovieDetailsModelToJson(MovieDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterUrl,
      'backdrop_path': instance.backdropUrl,
      'release_date': instance.releaseDate,
      'genres_name': instance.genres,
      'runtime': instance.runtime,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'trailer_url': instance.trailerUrl,
    };
