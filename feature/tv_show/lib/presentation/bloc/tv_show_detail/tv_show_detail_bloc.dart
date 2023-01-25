import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_show_detail.dart';
import 'package:core/domain/usecases/tv/get_tv_detail.dart';
import 'package:equatable/equatable.dart';

part 'tv_show_detail_event.dart';
part 'tv_show_detail_state.dart';

class TvShowDetailBloc extends Bloc<TvShowDetailEvent, TvShowDetailState> {
  final GetTvDetail  _getTVShowDetail;
  TvShowDetailBloc(this._getTVShowDetail) : super(TvShowDetailInitial()) {
    on<FetchTvShowDetail>(_fetchTVShowDetail);
  }


  FutureOr<void> _fetchTVShowDetail(
    FetchTvShowDetail event,
    Emitter<TvShowDetailState> emit,
  ) async {
    final id = event.id;

    emit(TvShowDetailLoading());

    final result = await _getTVShowDetail.execute(id);

    result.fold(
      (failure) {
        emit(TvShowDetailError(failure.message));
      },
      (data) {
        emit(TvShowDetailLoaded(data));
      },
    );
  }
}
