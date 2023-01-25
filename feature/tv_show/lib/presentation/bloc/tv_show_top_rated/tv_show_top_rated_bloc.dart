import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/usecases/tv/get_tvs_top_rated.dart';
import 'package:equatable/equatable.dart';

part 'tv_show_top_rated_event.dart';
part 'tv_show_top_rated_state.dart';

class TvShowTopRatedBloc extends Bloc<TvShowTopRatedEvent, TvShowTopRatedState> {
  final GetTvsTopRated _getTopRatedTVShows;
  TvShowTopRatedBloc(this._getTopRatedTVShows) : super(TvShowTopRatedInitial()) {
    on<FetchTvShowTopRated>(_fetchTopRatedTVShows);
  }

  FutureOr<void> _fetchTopRatedTVShows(
    FetchTvShowTopRated event,
    Emitter<TvShowTopRatedState> emit,
  ) async {
    emit(TvShowTopRatedLoading());

    final result = await _getTopRatedTVShows.execute();

    result.fold(
      (failure) {
        emit(TvShowTopRatedError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(TvShowTopRatedInitial())
            : emit(TvShowTopRatedLoaded(data));
      },
    );
  }
}
