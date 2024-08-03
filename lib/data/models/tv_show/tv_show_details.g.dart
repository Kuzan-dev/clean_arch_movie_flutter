// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowDetailsModel _$TvShowDetailsModelFromJson(Map<String, dynamic> json) =>
    TvShowDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['name'] as String?,
      posterUrl: json['poster_path'] as String?,
      backdropUrl: json['backdrop_path'] as String?,
      releaseDate: json['first_air_date'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      numberOfSeasons: (json['number_of_seasons'] as num?)?.toInt(),
      overview: json['overview'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as String?,
      trailerUrl: json['trailer_url'] as String?,
    );

Map<String, dynamic> _$TvShowDetailsModelToJson(TvShowDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'poster_path': instance.posterUrl,
      'backdrop_path': instance.backdropUrl,
      'first_air_date': instance.releaseDate,
      'genres': instance.genres,
      'number_of_seasons': instance.numberOfSeasons,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'trailer_url': instance.trailerUrl,
    };
