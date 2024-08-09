import 'package:clean_arch_movie_flutter/core/components/search_field/search_field.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    
    // Add listener to scroll controller
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // Check if more results need to be fetched
        context.read<SearchCubit>().fetchMoreResults();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<SearchCubit, SearchState>(
            listener: (context, state) {
              if (state is SearchError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
        ],
        child: SafeArea(
          child: Column(
            children: [
              const SearchField(),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, searchState) {
                    if (searchState is SearchLoading && searchState is! SearchLoaded) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (searchState is SearchLoaded) {
                      final searchResult = searchState.resultSearch;
                      return Stack(
                        children: [
                          GridView.builder(
                            controller: _scrollController,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: searchResult.length,
                            itemBuilder: (context, index) {
                              final searchEntity = searchResult[index];
                              return GestureDetector(
                                onTap: () {
                                  // Navegar a la vista de detalle
                                },
                                child: GridTile(
                                  footer: GridTileBar(
                                    title: Text('${searchEntity.title}'),
                                    backgroundColor: Colors.black54,
                                  ),
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) => Shimmer.fromColors(
                                      baseColor: Colors.grey[850]!,
                                      highlightColor: Colors.grey[800]!,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 200,
                                        color: Colors.white,
                                      ),
                                    ),
                                    imageUrl: 'https://image.tmdb.org/t/p/w300${searchEntity.posterUrl}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                          if (context.watch<SearchCubit>().hasReachedMax == false &&
                              (searchState is SearchLoading)) 
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: const CircularProgressIndicator(),
                              ),
                            ),
                        ],
                      );
                    } else if (searchState is SearchError) {
                      return Center(
                        child: Text("Error: ${searchState.message}"),
                      );
                    }
                    return const Center(child: Text('No results'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
