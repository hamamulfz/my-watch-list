import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/usecases/tv/get_tvs_popular.dart';
import 'package:equatable/equatable.dart';

part 'tv_show_popular_event.dart';
part 'tv_show_popular_state.dart';

class TvShowPopularBloc extends Bloc<TvShowPopularEvent, TvShowPopularState> {
  final GetTvsPopular _getPopularTVShows;
  TvShowPopularBloc(this._getPopularTVShows) : super(TvShowPopularInitial()) {
    on<FetchTvShowPopular>(_fetchPopularTVShows);
  }


  FutureOr<void> _fetchPopularTVShows(
    FetchTvShowPopular event,
    Emitter<TvShowPopularState> emit,
  ) async {
    emit(TvShowPopularLoading());

    final result = await _getPopularTVShows.execute();

    result.fold(
      (failure) {
        emit(TvShowPopularError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(TvShowPopularInitial())
            : emit(TvShowPopularLoaded(data));
      },
    );
  }
}
