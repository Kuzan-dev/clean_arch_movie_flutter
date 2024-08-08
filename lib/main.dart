import 'package:clean_arch_movie_flutter/config/router/app_router.dart';
import 'package:clean_arch_movie_flutter/core/database/local_database.dart';
import 'package:clean_arch_movie_flutter/core/network/dio_client.dart';
import 'package:clean_arch_movie_flutter/data/datasources/local/tv_show/tv_show_local_data_source.dart';
import 'package:clean_arch_movie_flutter/data/datasources/local/tv_show/tv_show_local_data_source_impl.dart';
import 'package:clean_arch_movie_flutter/data/datasources/remote/movies/movie_remote_data_source_impl.dart';
import 'package:clean_arch_movie_flutter/data/datasources/remote/tv_show/tv_show_data_souce.dart';
import 'package:clean_arch_movie_flutter/data/datasources/remote/tv_show/tv_show_data_source_impl.dart';
import 'package:clean_arch_movie_flutter/data/repositories/tv_show/tv_show_repository_impl.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/tv_show/tv_show_repository.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/get_popular_tv_show/get_popular_tv_show_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/get_top_rated_tv_show/get_top_rated_tv_show_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

part 'injector.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  await init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GetPopularTvShowCubit>(
          create: (context) =>
              injector<GetPopularTvShowCubit>()..getPopularTvShow(),
        ),
        Provider<GetTopRatedTvShowCubit>(
          create: (context) =>
              injector<GetTopRatedTvShowCubit>()..getTopRatedTvShow(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black,
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
