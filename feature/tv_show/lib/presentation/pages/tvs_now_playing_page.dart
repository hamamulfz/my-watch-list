
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_show/common/constant.dart';
import 'package:tv_show/presentation/bloc/tv_show_now_playing/tv_show_now_playing_bloc.dart';
import 'package:tv_show/presentation/widgets/tv_card_list.dart';

class TvsNowPlayingPage extends StatefulWidget {
  static const routeName = '/now-playing-tv';

  const TvsNowPlayingPage({super.key});

  @override
  TvsNowPlayingPageState createState() => TvsNowPlayingPageState();
}

class TvsNowPlayingPageState extends State<TvsNowPlayingPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<TvShowNowPlayingBloc>().add(FetchTvShowNowPlaying()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing Tv'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvShowNowPlayingBloc, TvShowNowPlayingState>(
          builder: (context, state) {
            if (state is TvShowNowPlayingLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvShowNowPlayingLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.result[index];
                  return TvCard(movie);
                },
                itemCount: state.result.length,
              );
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
}
