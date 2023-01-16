import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/movie/get_movies_now_playing.dart';
import 'package:ditonton/domain/usecases/movie/get_movies_popular.dart';
import 'package:ditonton/domain/usecases/tv/get_tvs_now_playing.dart';
import 'package:flutter/foundation.dart';

class TVNowPlayingNotifier extends ChangeNotifier {
  final GetTvsNowPlaying getNowPlayingTvss;

  TVNowPlayingNotifier(this.getNowPlayingTvss);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvShow> _movies = [];
  List<TvShow> get movie => _movies;

  String _message = '';
  String get message => _message;

  Future<void> fetchNowPlayingTvs() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingTvss.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (moviesData) {
        _movies = moviesData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
