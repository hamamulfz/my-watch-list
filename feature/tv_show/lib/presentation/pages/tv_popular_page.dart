
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_show/common/constant.dart';
import 'package:tv_show/presentation/bloc/tv_show_popular/tv_show_popular_bloc.dart';
import 'package:tv_show/presentation/widgets/tv_card_list.dart';



class TvPopularPage extends StatefulWidget {
  static const routeName = '/popular-tv';

  const TvPopularPage({super.key});

  @override
  TvPopularPageState createState() => TvPopularPageState();
}

class TvPopularPageState extends State<TvPopularPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
       context.read<TvShowPopularBloc>().add(FetchTvShowPopular()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Tv'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvShowPopularBloc, TvShowPopularState>(
          builder: (context, state) {
            if (state is TvShowPopularLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvShowPopularLoaded) {
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
