import 'package:clean_arch_movie_flutter/core/components/search_field/search_field.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: 12,
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              SearchField(),
            ],
          ),
        ),
      )
    );
  }
}
