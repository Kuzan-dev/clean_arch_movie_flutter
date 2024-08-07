import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class TvShowDetailView extends StatelessWidget {
  final int tvshowId;
  const TvShowDetailView(
      {super.key, @PathParam('tvshowId') required this.tvshowId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Tv Show ID: $tvshowId'),
    );
  }
}
