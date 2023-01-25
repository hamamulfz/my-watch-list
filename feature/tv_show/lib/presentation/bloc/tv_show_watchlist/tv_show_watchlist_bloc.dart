import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/entities/tv_show_detail.dart';
import 'package:core/domain/usecases/tv/get_tv_watchlist.dart';
import 'package:core/domain/usecases/tv/get_tv_watchlist_status.dart';
import 'package:core/domain/usecases/tv/remove_tv_watchlist.dart';
import 'package:core/domain/usecases/tv/save_tv_watchlist.dart';
import 'package:equatable/equatable.dart';

part 'tv_show_watchlist_event.dart';
part 'tv_show_watchlist_state.dart';

class TvShowWatchlistBloc
    extends Bloc<TvShowWatchlistEvent, TvShowWatchlistState> {
  final GetTvWatchlist _getWatchlistTVShows;
  final GetTvWatchListStatus _getWatchlistStatus;
  final RemoveTvWatchlist _removeWatchlist;
  final SaveTvWatchlist _saveWatchlist;

  TvShowWatchlistBloc(
    this._getWatchlistTVShows,
    this._getWatchlistStatus,
    this._removeWatchlist,
    this._saveWatchlist,
  ) : super(TvShowWatchlistInitial()) {
    on<FetchTVShowWatchlist>(_onFetchTvShowWatchlist);
    on<FetchWatchlistStatus>(_fetchWatchlistStatus);
    on<AddTVShowToWatchlist>(_addTVShowToWatchlist);
    on<RemoveTVShowFromWatchlist>(_removeTvShowFromWatchlist);
  }

  FutureOr<void> _onFetchTvShowWatchlist(
    FetchTVShowWatchlist event,
    Emitter<TvShowWatchlistState> emit,
  ) async {
    emit(TVShowWatchlistLoading());

    final result = await _getWatchlistTVShows.execute();

    result.fold(
      (failure) {
        emit(TVShowWatchlistError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(TVShowWatchlistEmpty())
            : emit(TVShowWatchlistLoaded(data));
      },
    );
  }

  FutureOr<void> _fetchWatchlistStatus(
    FetchWatchlistStatus event,
    Emitter<TvShowWatchlistState> emit,
  ) async {
    final id = event.id;

    final result = await _getWatchlistStatus.execute(id);

    emit(TVShowIsAddedToWatchlist(result));
  }

  FutureOr<void> _addTVShowToWatchlist(
    AddTVShowToWatchlist event,
    Emitter<TvShowWatchlistState> emit,
  ) async {
    final tvShow = event.tvShow;

    final result = await _saveWatchlist.execute(tvShow);

    result.fold(
      (failure) {
        emit(TVShowWatchlistError(failure.message));
      },
      (message) {
        emit(TVShowWatchlistMessage(message));
      },
    );
  }

  FutureOr<void> _removeTvShowFromWatchlist(
    RemoveTVShowFromWatchlist event,
    Emitter<TvShowWatchlistState> emit,
  ) async {
    final tvShow = event.tvShow;

    final result = await _removeWatchlist.execute(tvShow);

    result.fold(
      (failure) {
        emit(TVShowWatchlistError(failure.message));
      },
      (message) {
        emit(TVShowWatchlistMessage(message));
      },
    );
  }
}
