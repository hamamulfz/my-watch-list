import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/usecases/tv/get_tvs_now_playing.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_show/presentation/bloc/tv_show_search/tv_show_search_bloc.dart';

part 'tv_show_now_playing_event.dart';
part 'tv_show_now_playing_state.dart';

class TvShowNowPlayingBloc
    extends Bloc<TvShowNowPlayingEvent, TvShowNowPlayingState> {
  final GetTvsNowPlaying _getNowPlayingTVShows;
  TvShowNowPlayingBloc(this._getNowPlayingTVShows)
      : super(TvShowNowPlayingInitial()) {
    on<FetchTvShowNowPlaying>(_fetchNowPlayingTVShows);
  }

  FutureOr<void> _fetchNowPlayingTVShows(
      FetchTvShowNowPlaying event, Emitter<TvShowNowPlayingState> emit) async {
    emit(TvShowNowPlayingLoading());

    final result = await _getNowPlayingTVShows.execute();

    result.fold(
      (failure) {
        emit(TvShowNowPlayingError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(TvShowNowPlayingInitial())
            : emit(TvShowNowPlayingLoaded(data));
      },
    );
  }
}
