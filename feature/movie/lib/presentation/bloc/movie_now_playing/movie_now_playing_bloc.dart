import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/movie/get_movies_now_playing.dart';
import 'package:equatable/equatable.dart';

part 'movie_now_playing_event.dart';
part 'movie_now_playing_state.dart';

class MovieNowPlayingBloc
    extends Bloc<MovieNowPlayingEvent, MovieNowPlayingState> {
  final GetMoviesNowPlaying _getNowPlayingMovies;
  MovieNowPlayingBloc(this._getNowPlayingMovies)
      : super(MovieNowPlayingInitial()) {
    on<FetchMovieNowPlaying>(_fetchNowPlayingMovies);
  }

  FutureOr<void> _fetchNowPlayingMovies(
      FetchMovieNowPlaying event, Emitter<MovieNowPlayingState> emit) async {
    emit(MovieNowPlayingLoading());

    final result = await _getNowPlayingMovies.execute();

    result.fold(
      (failure) {
        emit(MovieNowPlayingError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(MovieNowPlayingInitial())
            : emit(MovieNowPlayingLoaded(data));
      },
    );
  }
}
