import 'package:clean_arch_movie_flutter/core/components/carrousell/section_listview_card.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class WatchlistView extends StatelessWidget {
  const WatchlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 30)),
          const Text('Watchlist'),
          Expanded(
              child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 8),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 1,
                    childAspectRatio: 0.44,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
                      child: Text('Watchlist Item $index'),
                    );
                  },
                  itemCount: 10,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
