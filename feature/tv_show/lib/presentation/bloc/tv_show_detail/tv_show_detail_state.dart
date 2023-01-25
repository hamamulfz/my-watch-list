part of 'tv_show_detail_bloc.dart';

abstract class TvShowDetailState extends Equatable {
  const TvShowDetailState();
  
  @override
  List<Object> get props => [];
}

class TvShowDetailInitial extends TvShowDetailState {}

class TvShowDetailLoading extends TvShowDetailState {
  @override
  List<Object> get props => [];
}

class TvShowDetailError extends TvShowDetailState {
  final String message;

  const TvShowDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class TvShowDetailLoaded extends TvShowDetailState {
  final TVShowDetail result;

  const TvShowDetailLoaded(this.result);

  @override
  List<Object> get props => [result];
}
