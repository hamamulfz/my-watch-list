part of 'tv_show_detail_bloc.dart';

abstract class TvShowDetailEvent extends Equatable {}

class FetchTvShowDetail extends TvShowDetailEvent {
  final int id;

  FetchTvShowDetail(this.id);

  @override
  List<Object> get props => [id];
}
