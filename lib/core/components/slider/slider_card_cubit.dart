import 'package:clean_arch_movie_flutter/core/components/slider/slider_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SliderCardCubit extends Cubit<SliderCardState>{
  SliderCardCubit() : super(SliderCardState(imageUrlList: _defaultImageUrlList));

  static const List<String> _defaultImageUrlList = [
    "https://i0.hdslb.com/bfs/manga-static/42b2143b5694835ae35763bea634cdfc36392801.jpg@300w.jpg",
    "https://i0.hdslb.com/bfs/manga-static/87e22d652eb4c456fe251e15b57bbb25da39925a.jpg@300w.jpg",
    "https://i0.hdslb.com/bfs/manga-static/3f01609c36d4816eb227c95ac31471710fa706e6.jpg@300w.jpg",
    "https://i0.hdslb.com/bfs/manga-static/6b5ab1a7cb883504db182ee46381835e70d6d460.jpg@300w.jpg",
    "https://i0.hdslb.com/bfs/manga-static/5482454680757477d728dae82f80a280a9cc97a2.jpg@300w.jpg",
  ];

  void changeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}