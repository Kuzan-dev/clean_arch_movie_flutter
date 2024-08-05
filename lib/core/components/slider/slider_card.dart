import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_movie_flutter/core/components/slider/slider_card_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SliderCardCubit>();

    final cubitState = cubit.state;

    final controller = Gallery3DController(
      itemCount: cubitState.imageUrlList.length,
      autoLoop: true,
      ellipseHeight: 0,
      minScale: 0.4,
    );
    return Gallery3D(
      controller: controller,
      padding: const EdgeInsets.only(bottom: 10),
      itemConfig: const GalleryItemConfig(
        width: 220,
        height: 300,
        radius: 10,
      ),
      width: MediaQuery.of(context).size.width,
      height: 500,
      isClip: true,
      onItemChanged: (index){
        cubit.changeIndex(index);
      },
      itemBuilder: (context, index){
        return Image.network(
          cubitState.imageUrlList[index],
          fit: BoxFit.fill,
        );
      },
    );
  }
}