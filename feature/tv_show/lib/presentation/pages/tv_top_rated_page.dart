import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tv_show/common/constant.dart';
import 'package:tv_show/presentation/bloc/tv_show_top_rated/tv_show_top_rated_bloc.dart';
import 'package:tv_show/presentation/widgets/tv_card_list.dart';

class TvTopRatedPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-tv';

  @override
  _TvTopRatedPageState createState() => _TvTopRatedPageState();
}

class _TvTopRatedPageState extends State<TvTopRatedPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
         BlocProvider.of<TvShowTopRatedBloc>(context, listen: false)
            .add(FetchTvShowTopRated()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated TV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvShowTopRatedBloc, TvShowTopRatedState>(
          builder: (context, state) {
            if (state is TvShowTopRatedLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvShowTopRatedLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.result[index];
                  return TvCard(movie);
                },
                itemCount: state.result.length,
              );
            } else {
              return Center(
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
