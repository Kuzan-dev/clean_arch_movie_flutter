import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MovieDetailView extends StatefulWidget {
  final int movieId;
  const MovieDetailView(
      {super.key, @PathParam('movieId') required this.movieId});

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Movie ID:'),
    );
  }
}

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget(
      {super.key, required this.movieDetails, required this.movieCredit});

  final MovieDetailsEntity movieDetails;
  final MovieCreditEntity movieCredit;

  @override
  Widget build(BuildContext context) {
    return const Text('Movie Details');
  }
}
