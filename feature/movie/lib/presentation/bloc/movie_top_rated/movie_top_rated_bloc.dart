import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/movie/get_movies_top_rated.dart';
import 'package:equatable/equatable.dart';

part 'movie_top_rated_event.dart';
part 'movie_top_rated_state.dart';

class MovieTopRatedBloc extends Bloc<MovieTopRatedEvent, MovieTopRatedState> {
  final GetMoviesTopRated _getTopRatedMovies;
  MovieTopRatedBloc(this._getTopRatedMovies) : super(MovieTopRatedInitial()) {
    on<FetchMovieTopRated>(_onTopRatedMovies);
  }

  FutureOr<void> _onTopRatedMovies(
    FetchMovieTopRated event,
    Emitter<MovieTopRatedState> emit,
  ) async {
    emit(MovieTopRatedLoading());

    final result = await _getTopRatedMovies.execute();

    result.fold(
      (failure) {
        emit(MovieTopRatedError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(MovieTopRatedInitial())
            : emit(MovieTopRatedLoaded(data));
      },
    );
  }
}
