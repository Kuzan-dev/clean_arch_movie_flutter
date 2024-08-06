import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MovieDetailView extends StatelessWidget {
  final int movieId;
  const MovieDetailView({super.key, @PathParam('movieId') required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Movie ID: $movieId'),
    );
  }
}