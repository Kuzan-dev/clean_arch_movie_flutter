import 'package:auto_route/annotations.dart';
import 'package:clean_arch_movie_flutter/core/components/slider/slider_card.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> testList = [
      {
        'backdrop_path': '/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg',
        'poster_path': '/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg',
        'id': '1'
      },
      {
        'backdrop_path': '/3q01ACG0MWm0DekhvkPFCXyPZSu.jpg',
        'poster_path': '/oGythE98MYleE6mZlGs5oBGkux1.jpg',
        'id': '2'
      },
      {
        'backdrop_path': '/2RVcJbWFmICRDsVxRI8F5xRmRsK.jpg',
        'poster_path': '/yrpPYKijwdMHyTGIOd1iK1h0Xno.jpg',
        'id': '23'
      },
      {
        'backdrop_path': '/stKGOm8UyhuLPR9sZLjs5AkmncA.jpg',
        'poster_path': '/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg',
        'id': '3'
      },
      {
        'backdrop_path': '/lgkPzcOSnTvjeMnuFzozRO5HHw1.jpg',
        'poster_path': '/wWba3TaojhK7NdycRhoQpsG0FaH.jpg',
        'id': '4'
      }
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SliderCard(
              mediaType: 'movie',
              list: testList,
              index: 0,
            ),
          ],
        ),
      ),
    );
  }
}
