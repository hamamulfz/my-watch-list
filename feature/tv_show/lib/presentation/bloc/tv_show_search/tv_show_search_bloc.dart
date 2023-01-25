import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/usecases/tv/search_tv.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'tv_show_search_event.dart';
part 'tv_show_search_state.dart';

class TvShowSearchBloc extends Bloc<TvShowSearchEvent, TvShowSearchState> {
  final SearchTv _searchTVShows;
  TvShowSearchBloc(this._searchTVShows) : super(TvShowSearchInitial()) {
    on<OnQueryTVShowsChange>(_onQueryTVShowsChange);
  }

  FutureOr<void> _onQueryTVShowsChange(
      OnQueryTVShowsChange event, Emitter<TvShowSearchState> emit) async {
    final query = event.query;
    emit(TvShowSearchLoading());

    final result = await _searchTVShows.execute(query);

    result.fold(
      (failure) {
        emit(TvShowSearchError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(TvShowSearchEmpty())
            : emit(TvShowSearchLoaded(data));
      },
    );
  }

  @override
  Stream<TvShowSearchState> get stream =>
      super.stream.debounceTime(const Duration(milliseconds: 200));
}
