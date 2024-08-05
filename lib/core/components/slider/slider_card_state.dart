
import 'package:equatable/equatable.dart';

class SliderCardState extends Equatable {
  final List<String> imageUrlList;
  final int currentIndex;

  const SliderCardState({
    required this.imageUrlList,
    this.currentIndex = 0,
  });
  
  SliderCardState copyWith({
    List<String>? imageUrlList,
    int? currentIndex,
  }) {
    return SliderCardState(
      imageUrlList: imageUrlList ?? this.imageUrlList,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [imageUrlList, currentIndex];
}