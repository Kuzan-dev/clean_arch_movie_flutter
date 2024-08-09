import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MovieTopRatedView extends StatelessWidget {
  final List<dynamic> listData;
  const MovieTopRatedView ({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Top Rated'),
    );
  }
}