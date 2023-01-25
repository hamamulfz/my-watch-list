import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:equatable/equatable.dart';

part 'movie_recommendation_event.dart';
part 'movie_recommendation_state.dart';

class MovieRecommendationBloc
    extends Bloc<MovieRecommendationEvent, MovieRecommendationState> {
  final GetMovieRecommendations _getMovieRecommendations;

  MovieRecommendationBloc(this._getMovieRecommendations)
      : super(MovieRecommendationInitial()) {
    on<FetchMovieRecommendation>(_fetchMovieRecommendations);
  }

  FutureOr<void> _fetchMovieRecommendations(
    FetchMovieRecommendation event,
    Emitter<MovieRecommendationState> emit,
  ) async {
    final id = event.id;
    emit(MovieRecommendationLoading());

    final result = await _getMovieRecommendations.execute(id);

    result.fold(
      (failure) {
        emit(MovieRecommendationError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(MovieRecommendationInitial())
            : emit(MovieRecommendationLoaded(data));
      },
    );
  }
}
