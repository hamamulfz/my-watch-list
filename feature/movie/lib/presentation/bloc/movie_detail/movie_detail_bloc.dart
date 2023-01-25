import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:core/domain/usecases/movie/get_movie_detail.dart';
import 'package:equatable/equatable.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail _getMovieDetail;
  MovieDetailBloc(this._getMovieDetail) : super(MovieDetailInitial()) {
    on<FetchMovieDetail>(_fetchMovieDetail);
  }

  FutureOr<void> _fetchMovieDetail(
      FetchMovieDetail event, Emitter<MovieDetailState> emit) async {
    final id = event.id;

    emit(MovieDetailLoading());
    final result = await _getMovieDetail.execute(id);

    result.fold((failure) {
      emit(MovieDetailError(failure.message));
    }, (success) {
      emit(MovieDetailLoaded(success));
    });
  }
}
