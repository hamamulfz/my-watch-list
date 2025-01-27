import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:core/domain/usecases/movie/search_movies.dart';
import 'package:rxdart/rxdart.dart';
part 'movie_search_event.dart';
part 'movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final SearchMovies _searchMovies;
  MovieSearchBloc(this._searchMovies) : super(MovieSearchInitial()) {
    on<OnQueryMoviesChange>(_fetchQueryMoviesChange);
  }


  FutureOr<void> _fetchQueryMoviesChange(
      OnQueryMoviesChange event, Emitter<MovieSearchState> emit) async {
    final query = event.query;
    emit(MovieSearchLoading());

    final result = await _searchMovies.execute(query);

    result.fold(
      (failure) {
        emit(MovieSearchError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(MovieSearchEmpty())
            : emit(MovieSearchLoaded(data));
      },
    );
  }

  @override
  Stream<MovieSearchState> get stream =>
      super.stream.debounceTime(const Duration(milliseconds: 200));
}
