import 'package:about/about_page.dart';
import 'package:core/common/utils/utils.dart';
import 'package:core/core.dart';
import 'package:ditonton/firebase_options.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/presentation/widgets/ditonton_drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:movie/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:movie/presentation/bloc/movie_recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/bloc/movie_search/movie_search_bloc.dart';
import 'package:movie/presentation/bloc/movie_top_rated/movie_top_rated_bloc.dart';
import 'package:movie/presentation/bloc/movie_watchlist/movie_watchlist_bloc.dart';
import 'package:movie/presentation/pages/movie_detail_page.dart';
import 'package:movie/presentation/pages/movie_home_page.dart';
import 'package:movie/presentation/pages/movies_now_playing_page.dart';
import 'package:movie/presentation/pages/movies_popular_page.dart';
import 'package:movie/presentation/pages/movies_search_page.dart';
import 'package:movie/presentation/pages/movies_top_rated_page.dart';
import 'package:movie/presentation/pages/watchlist_movies_page.dart';
import 'package:ssl_pinning/network_ssl_pinning.dart';
import 'package:tv_show/presentation/bloc/tv_show_detail/tv_show_detail_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_now_playing/tv_show_now_playing_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_popular/tv_show_popular_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_recommendation/tv_show_recommendation_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_search/tv_show_search_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_top_rated/tv_show_top_rated_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_watchlist/tv_show_watchlist_bloc.dart';
import 'package:tv_show/presentation/pages/tv_detail_page.dart';
import 'package:tv_show/presentation/pages/tv_home_page.dart';
import 'package:tv_show/presentation/pages/tv_popular_page.dart';
import 'package:tv_show/presentation/pages/tv_search_page.dart';
import 'package:tv_show/presentation/pages/tv_top_rated_page.dart';
import 'package:tv_show/presentation/pages/tvs_now_playing_page.dart';
import 'package:tv_show/presentation/pages/tvs_watchlist_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NetworkSslPinning.init();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<MovieRecommendationBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvShowRecommendationBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvShowDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieNowPlayingBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvShowNowPlayingBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvShowTopRatedBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieTopRatedBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvShowPopularBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MoviePopularBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvShowWatchlistBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieWatchlistBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvShowSearchBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieSearchBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Ditonton',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: MovieHomePage(
          drawer: DitontonDrawer(),
        ),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case MovieHomePage.routeName:
              return MaterialPageRoute(
                  builder: (_) => MovieHomePage(
                        drawer: DitontonDrawer(),
                      ));
            case TvHomePage.routeName:
              return MaterialPageRoute(
                  builder: (_) => TvHomePage(
                        drawer: DitontonDrawer(),
                      ));
            case PopularMoviesPage.routeName:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case NowPlayingMoviesPage.routeName:
              return CupertinoPageRoute(builder: (_) => NowPlayingMoviesPage());
            case TvsNowPlayingPage.routeName:
              return CupertinoPageRoute(builder: (_) => TvsNowPlayingPage());
            case TvPopularPage.routeName:
              return CupertinoPageRoute(builder: (_) => TvPopularPage());
            case TopRatedMoviesPage.routeName:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case TvTopRatedPage.routeName:
              return CupertinoPageRoute(builder: (_) => TvTopRatedPage());
            case MovieDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case TvDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvDetailPage(id: id),
                settings: settings,
              );
            case MovieSearchPage.routeName:
              return CupertinoPageRoute(builder: (_) => MovieSearchPage());
            case TvSearchPage.routeName:
              return CupertinoPageRoute(builder: (_) => TvSearchPage());
            case WatchlistMoviesPage.routeName:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case TvsWatchlistPage.routeName:
              return MaterialPageRoute(builder: (_) => TvsWatchlistPage());
            case AboutPage.routeName:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  appBar: AppBar(),
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
