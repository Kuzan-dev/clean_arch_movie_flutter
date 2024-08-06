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
      {'backdrop_path': 'https://i0.hdslb.com/bfs/manga-static/42b2143b5694835ae35763bea634cdfc36392801.jpg@300w.jpg', 
      'poster_path': 'https://i0.hdslb.com/bfs/manga-static/42b2143b5694835ae35763bea634cdfc36392801.jpg@300w.jpg', 'id': '0'},

      {'backdrop_path': 'https://i0.hdslb.com/bfs/manga-static/87e22d652eb4c456fe251e15b57bbb25da39925a.jpg@300w.jpg', 'poster_path': 'https://i0.hdslb.com/bfs/manga-static/87e22d652eb4c456fe251e15b57bbb25da39925a.jpg@300w.jpg', 'id': '1'},

      {'backdrop_path': 'https://i0.hdslb.com/bfs/manga-static/3f01609c36d4816eb227c95ac31471710fa706e6.jpg@300w.jpg', 'poster_path': 'https://i0.hdslb.com/bfs/manga-static/3f01609c36d4816eb227c95ac31471710fa706e6.jpg@300w.jpg', 'id': '2'},

      {'backdrop_path': 'https://i0.hdslb.com/bfs/manga-static/6b5ab1a7cb883504db182ee46381835e70d6d460.jpg@300w.jpg', 'poster_path': 'https://i0.hdslb.com/bfs/manga-static/6b5ab1a7cb883504db182ee46381835e70d6d460.jpg@300w.jpg', 'id': '3'},

      {'backdrop_path': 'https://i0.hdslb.com/bfs/manga-static/5482454680757477d728dae82f80a280a9cc97a2.jpg@300w.jpg', 'poster_path': 'https://i0.hdslb.com/bfs/manga-static/5482454680757477d728dae82f80a280a9cc97a2.jpg@300w.jpg', 'id': '4'}
      
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
