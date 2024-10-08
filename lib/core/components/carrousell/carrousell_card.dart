import 'package:flutter/material.dart';

class CarrousellCard extends StatelessWidget {
  final int itemCount;
  final double height;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const CarrousellCard({
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: itemBuilder,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: itemCount));
  }
}
