part of 'tv_show_now_playing_bloc.dart';

abstract class TvShowNowPlayingState extends Equatable {
  const TvShowNowPlayingState();
  
  @override
  List<Object> get props => [];
}

class TvShowNowPlayingInitial extends TvShowNowPlayingState {}

class TvShowNowPlayingLoading extends TvShowNowPlayingInitial {
  @override
  List<Object> get props => [];
}

class TvShowNowPlayingError extends TvShowNowPlayingInitial {
  final String message;

  TvShowNowPlayingError(this.message);

  @override
  List<Object> get props => [message];
}

class TvShowNowPlayingLoaded extends TvShowNowPlayingInitial {
  final List<TvShow> result;

  TvShowNowPlayingLoaded(this.result);

  @override
  List<Object> get props => [result];
}
