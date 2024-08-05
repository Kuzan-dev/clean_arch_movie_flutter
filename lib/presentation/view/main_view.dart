import 'package:clean_arch_movie_flutter/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';

@RoutePage()
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        resizeToAvoidBottomInset: true,
        lazyLoad: true,
        animationDuration: const Duration(milliseconds: 200),
        routes: const [
          MoviesRoute(),
          SearchRoute(),
          TvShowRoute(),
          WatchlistRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return CrystalNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              CrystalNavigationBarItem(
                icon: Icons.movie,
                unselectedColor: Colors.blue,
                selectedColor: Colors.blue,
              ),
              CrystalNavigationBarItem(
                icon: Icons.search,
                unselectedColor: Colors.blue,
                selectedColor: Colors.blue,
              ),
              CrystalNavigationBarItem(
                icon: Icons.tv,
                unselectedColor: Colors.blue,
                selectedColor: Colors.blue,
              ),
              CrystalNavigationBarItem(
                icon: Icons.bookmark,
                unselectedColor: Colors.blue,
                selectedColor: Colors.blue,
              ),
            ],
          );
        });
  }
}
