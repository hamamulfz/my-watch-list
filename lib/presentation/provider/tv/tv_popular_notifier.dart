import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/tv/get_tvs_popular.dart';
import 'package:flutter/foundation.dart';

class TvPopularNotifier extends ChangeNotifier {
  final GetTvsPopular getPopularMovies;

  TvPopularNotifier(this.getPopularMovies);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvShow> _tvShows = [];
  List<TvShow> get tv => _tvShows;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularTv() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getPopularMovies.execute();

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
