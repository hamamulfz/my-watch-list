import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:equatable/equatable.dart';

part 'tv_show_recommendation_event.dart';
part 'tv_show_recommendation_state.dart';

class TvShowRecommendationBloc
    extends Bloc<TvShowRecommendationEvent, TvShowRecommendationState> {
  final GetTvRecommendations _getTVShowRecommendations;
  TvShowRecommendationBloc(this._getTVShowRecommendations)
      : super(TvShowRecommendationInitial()) {
    on<FetchTvShowRecommendation>(_fetchTVShowRecommendations);
  }

  FutureOr<void> _fetchTVShowRecommendations(
    FetchTvShowRecommendation event,
    Emitter<TvShowRecommendationState> emit,
  ) async {
    final id = event.id;
    emit(TvShowRecommendationLoading());

    final result = await _getTVShowRecommendations.execute(id);

    result.fold(
      (failure) {
        emit(TvShowRecommendationError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(TvShowRecommendationInitial())
            : emit(TvShowRecommendationLoaded(data));
      },
    );
  }
}
