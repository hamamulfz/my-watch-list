import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/movie/get_movies_now_playing.dart';
import 'package:ditonton/domain/usecases/movie/get_movies_popular.dart';
import 'package:flutter/foundation.dart';

class NowPlayingMoviesNotifier extends ChangeNotifier {
  final GetMoviesNowPlaying getNowPlayingMovies;

  NowPlayingMoviesNotifier(this.getNowPlayingMovies);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Movie> _movies = [];
  List<Movie> get movie => _movies;

  String _message = '';
  String get message => _message;

  Future<void> fetchNowPlayingMovies() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingMovies.execute();

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
