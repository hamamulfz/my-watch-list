import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
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
  static const ROUTE_NAME = '/tv';

  const TvHomePage({super.key, required this.drawer});
  @override
  _TvHomePageState createState() => _TvHomePageState();
}

class _TvHomePageState extends State<TvHomePage> {
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
        title: Text('Ditonton Tv'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, TvSearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
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
                    Navigator.pushNamed(context, TvsNowPlayingPage.ROUTE_NAME),
              ),
              BlocBuilder<TvShowNowPlayingBloc, TvShowNowPlayingState>(builder: (context, state) {
                
                if (state is TvShowNowPlayingLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvShowNowPlayingLoaded) {
                  return MovieList(state.result);
                } else {
                  return Text('Failed');
                }
              }),
              SubheadingWidget(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, TvPopularPage.ROUTE_NAME),
              ),
              BlocBuilder<TvShowPopularBloc, TvShowPopularState>(builder: (context, state) {
                
                if (state is TvShowPopularLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvShowPopularLoaded) {
                  return MovieList(state.result);
                } else {
                  return Text('Failed');
                }
              }),
              SubheadingWidget(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TvTopRatedPage.ROUTE_NAME),
              ),
              BlocBuilder<TvShowTopRatedBloc, TvShowTopRatedState>(builder: (context, state) {
                
                if (state is TvShowTopRatedLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvShowTopRatedLoaded) {
                  return MovieList(state.result);
                } else {
                  return Text('Failed');
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
  final title;
  final onTap;
  const SubheadingWidget({
    Key? key, this.title, this.onTap,
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
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<TvShow> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  TvDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
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
