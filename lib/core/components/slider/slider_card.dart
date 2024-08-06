import 'dart:ui';
import 'package:clean_arch_movie_flutter/core/extras/functions.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:flutter/material.dart';

class SliderCard extends StatefulWidget{
  final String mediaType;
  final List<dynamic> list;
  final int index;

  const SliderCard({super.key, required this.list, required this.index, required this.mediaType});

  @override
  State<SliderCard> createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index; // Inicializa el índice actual
  }
  @override
  Widget build(BuildContext context) {
    final controller = Gallery3DController(
      itemCount: widget.list.length,
      autoLoop: true,
      ellipseHeight: 0,
      minScale: 0.4,
    );
    return SafeArea(
      child: Stack(
        children:[
          //Configuración del fondo de la tarjeta
          Stack(
            children: [
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/backdrop.png",
                  image:'https://image.tmdb.org/t/p/w780${widget.list[_currentIndex]['backdrop_path']}',
                  fit: BoxFit.cover,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 8),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ]
          ),
          //Configuración del carrousel
          Container(
            padding: const EdgeInsets.only(top: 40),
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Gallery3D(
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
              onClickItem: (index){
                navigateToDetailsView(context, widget.mediaType, int.parse(widget.list[index]['id']));
              },
              onItemChanged: (index) {
                setState(() {
                  _currentIndex = index;
                  print(index);
                });
       },
              itemBuilder: (context, index){
                return FadeInImage.assetNetwork(
                  placeholder: 'assets/poster.png',
                  image:"https://image.tmdb.org/t/p/w780${widget.list[index]['poster_path']}",
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}