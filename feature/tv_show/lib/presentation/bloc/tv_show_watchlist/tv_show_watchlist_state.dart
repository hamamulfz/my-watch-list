part of 'tv_show_watchlist_bloc.dart';

abstract class TvShowWatchlistState extends Equatable {
  const TvShowWatchlistState();
  
  @override
  List<Object> get props => [];
}

class TvShowWatchlistInitial extends TvShowWatchlistState {}

class TVShowWatchlistEmpty extends TvShowWatchlistState {
  @override
  List<Object> get props => [];
}

class TVShowWatchlistLoading extends TvShowWatchlistState {
  @override
  List<Object> get props => [];
}

class TVShowWatchlistError extends TvShowWatchlistState {
  final String message;

  TVShowWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

class TVShowWatchlistLoaded extends TvShowWatchlistState {
  final List<TvShow> result;

  TVShowWatchlistLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class TVShowIsAddedToWatchlist extends TvShowWatchlistState {
  final bool isAdded;

  TVShowIsAddedToWatchlist(this.isAdded);

  @override
  List<Object> get props => [isAdded];
}

class TVShowWatchlistMessage extends TvShowWatchlistState {
  final String message;

  TVShowWatchlistMessage(this.message);

  @override
  List<Object> get props => [message];
}