import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String? author;
  final String? userName;
  final String? avatarUrl;
  final double? rating;
  final String? content;


  const ReviewEntity({
    this.author,
    this.content,
    this.userName,
    this.avatarUrl,
    this.rating,
  });

  @override
  List<Object?> get props => [author, content, userName, avatarUrl, rating];
}