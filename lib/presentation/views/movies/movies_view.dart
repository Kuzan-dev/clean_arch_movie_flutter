import 'package:clean_arch_movie_flutter/core/components/slider/slider_card.dart';
import 'package:clean_arch_movie_flutter/core/components/slider/slider_card_cubit.dart';
import 'package:clean_arch_movie_flutter/core/components/slider/slider_card_state.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<SliderCardCubit, SliderCardState>(
          builder: (context, currentIndex) {
            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 40),
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: const SliderCard(),
                    ),
                  ],
                ),
                
              ],
            );
          },
        ),      
      ),
    );
  }
}
