import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_now_playing/tv_show_now_playing_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_popular/tv_show_popular_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_top_rated/tv_show_top_rated_bloc.dart';
import 'package:tv_show/presentation/pages/tv_detail_page.dart';
import 'package:tv_show/presentation/pages/tv_popular_page.dart';
import 'package:tv_show/presentation/pages/tv_search_page.dart';
import 'package:tv_show/presentation/pages/tv_top_rated_page.dart';
import 'package:tv_show/presentation/pages/tvs_now_playing_page.dart';




class TvHomePage extends StatefulWidget {
  final Widget drawer;
  static const routeName = '/tv';

  const TvHomePage({super.key, required this.drawer});
  @override
  TvHomePageState createState() => TvHomePageState();
}

class TvHomePageState extends State<TvHomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () {
            context.read<TvShowNowPlayingBloc>().add(FetchTvShowNowPlaying());
      context.read<TvShowPopularBloc>().add(FetchTvShowPopular());
      context.read<TvShowTopRatedBloc>().add(FetchTvShowTopRated());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.drawer,
      appBar: AppBar(
        title: const Text('Ditonton Tv'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, TvSearchPage.routeName);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              SubheadingWidget(
                title: 'Now Playing',
                onTap: () =>
                    Navigator.pushNamed(context, TvsNowPlayingPage.routeName),
              ),
              BlocBuilder<TvShowNowPlayingBloc, TvShowNowPlayingState>(builder: (context, state) {
                
                if (state is TvShowNowPlayingLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvShowNowPlayingLoaded) {
                  return MovieList(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
              SubheadingWidget(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, TvPopularPage.routeName),
              ),
              BlocBuilder<TvShowPopularBloc, TvShowPopularState>(builder: (context, state) {
                
                if (state is TvShowPopularLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvShowPopularLoaded) {
                  return MovieList(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
              SubheadingWidget(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TvTopRatedPage.routeName),
              ),
              BlocBuilder<TvShowTopRatedBloc, TvShowTopRatedState>(builder: (context, state) {
                
                if (state is TvShowTopRatedLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvShowTopRatedLoaded) {
                  return MovieList(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

}

class SubheadingWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  const SubheadingWidget({
    Key? key,required  this.title, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<TvShow> movies;

  const MovieList(this.movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvDetailPage.routeName,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${movie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
