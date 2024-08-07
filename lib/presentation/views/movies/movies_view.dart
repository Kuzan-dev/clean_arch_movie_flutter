import 'package:auto_route/annotations.dart';
import 'package:clean_arch_movie_flutter/core/components/slider/slider_card.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> testList = [
      {
        'backdropUrl': '/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg',
        'posterUrl': '/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg',
        'id': 1
      },
      {
        'backdropUrl': '/3q01ACG0MWm0DekhvkPFCXyPZSu.jpg',
        'posterUrl': '/oGythE98MYleE6mZlGs5oBGkux1.jpg',
        'id': 2
      },
      {
        'backdropUrl': '/2RVcJbWFmICRDsVxRI8F5xRmRsK.jpg',
        'posterUrl': '/yrpPYKijwdMHyTGIOd1iK1h0Xno.jpg',
        'id': 23
      },
      {
        'backdropUrl': '/stKGOm8UyhuLPR9sZLjs5AkmncA.jpg',
        'posterUrl': '/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg',
        'id': 3
      },
      {
        'backdropUrl': '/lgkPzcOSnTvjeMnuFzozRO5HHw1.jpg',
        'posterUrl': '/wWba3TaojhK7NdycRhoQpsG0FaH.jpg',
        'id': 4
      }
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('hols')
            // SliderCard(
            //   mediaType: 'movie',
            //   list: testList,
            //   index: 0,
            // ),
          ],
        ),
      ),
    );
  }
}
