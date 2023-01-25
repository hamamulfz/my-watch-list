import 'package:core/core.dart';
import 'package:core/core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tv_show/presentation/bloc/tv_show_search/tv_show_search_bloc.dart';
import 'package:tv_show/presentation/widgets/tv_card_list.dart';

class TvSearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/search-tv';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Tv'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                context
                      .read<TvShowSearchBloc>()
                      .add(OnQueryTVShowsChange(query));
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            BlocBuilder<TvShowSearchBloc, TvShowSearchState>(
              builder: (context, state) {
                if (state is TvShowSearchLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvShowSearchLoaded) {
                  
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final movie = state.result[index];
                        return TvCard(movie);
                      },
                      itemCount: state.result.length,
                    ),
                  );
                } else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
