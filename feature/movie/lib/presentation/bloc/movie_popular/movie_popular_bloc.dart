import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/movie/get_movies_popular.dart';
import 'package:equatable/equatable.dart';

part 'movie_popular_event.dart';
part 'movie_popular_state.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  final GetMoviesPopular _getPopularMovies;
  MoviePopularBloc(this._getPopularMovies) : super(MoviePopularInitial()) {
    on<FetchMoviePopular>(_fetchPopularMovies);
  }



  FutureOr<void> _fetchPopularMovies(
    FetchMoviePopular event,
    Emitter<MoviePopularState> emit,
  ) async {
    emit(MoviePopularLoading());

    final result = await _getPopularMovies.execute();

    result.fold(
      (failure) {
        emit(MoviePopularError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(MoviePopularInitial())
            : emit(MoviePopularLoaded(data));
      },
    );
  }
}
