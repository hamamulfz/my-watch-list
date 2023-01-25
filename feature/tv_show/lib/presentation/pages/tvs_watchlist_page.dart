import 'package:core/common/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tv_show/common/constant.dart';
import 'package:tv_show/presentation/bloc/tv_show_watchlist/tv_show_watchlist_bloc.dart';
import 'package:tv_show/presentation/widgets/tv_card_list.dart';

class TvsWatchlistPage extends StatefulWidget {
  static const routeName = '/watchlist-tv';

  const TvsWatchlistPage({super.key});

  @override
  TvsWatchlistPageState createState() => TvsWatchlistPageState();
}

class TvsWatchlistPageState extends State<TvsWatchlistPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<TvShowWatchlistBloc>().add(FetchTVShowWatchlist()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    BlocProvider.of<TvShowWatchlistBloc>(context, listen: false)
        .add(FetchTVShowWatchlist());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvShowWatchlistBloc, TvShowWatchlistState>(
          builder: (context, state) {
            if (state is TVShowWatchlistLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TVShowWatchlistLoaded) {
              if (state.result.isEmpty) {
                return const Center(
                  child: Text(
                    "No data yet",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.result[index];
                  return TvCard(movie);
                },
                itemCount: state.result.length,
              );
            } else if (state is TVShowWatchlistEmpty) {
              return const Center(child: Text("No Watchlist Data"));
            } else {
              return const Center(
                key: Key('error_message'),
                child: Text(failedToFetchDataMessage),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
