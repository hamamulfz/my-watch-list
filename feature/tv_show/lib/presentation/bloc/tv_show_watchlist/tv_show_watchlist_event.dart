part of 'tv_show_watchlist_bloc.dart';

abstract class TvShowWatchlistEvent extends Equatable {
  
}

class FetchTVShowWatchlist extends TvShowWatchlistEvent {
  @override
  List<Object> get props => [];
}

class FetchWatchlistStatus extends TvShowWatchlistEvent {
  final int id;

  FetchWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}

class AddTVShowToWatchlist extends TvShowWatchlistEvent {
  final TVShowDetail tvShow;

  AddTVShowToWatchlist(this.tvShow);

  @override
  List<Object> get props => [tvShow];
}

class RemoveTVShowFromWatchlist extends TvShowWatchlistEvent {
  final TVShowDetail tvShow;

  RemoveTVShowFromWatchlist(this.tvShow);

  @override
  List<Object> get props => [tvShow];
}
