import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/tv/get_tvs_top_rated.dart';
import 'package:flutter/foundation.dart';

class TvTopRatedNotifier extends ChangeNotifier {
  final GetTvsTopRated getTopRatedTvs;

  TvTopRatedNotifier({required this.getTopRatedTvs});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvShow> _tvShows = [];
  List<TvShow> get movies => _tvShows;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRatedTv() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTvs.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvData) {
        _tvShows = tvData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
