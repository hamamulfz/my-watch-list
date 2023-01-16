import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/usecases/tv/get_tv_watchlist.dart';

class TvWatchlistNotifier extends ChangeNotifier {
  var _watchlistMovies = <TvShow>[];
  List<TvShow> get watchlistTvs => _watchlistMovies;

  var _watchlistState = RequestState.Empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  TvWatchlistNotifier({required this.getWatchlistTvs});

  final GetTvWatchlist getWatchlistTvs;

  Future<void> fetchWatchlistTvs() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTvs.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _watchlistState = RequestState.Loaded;
        _watchlistMovies = moviesData;
        notifyListeners();
      },
    );
  }
}
