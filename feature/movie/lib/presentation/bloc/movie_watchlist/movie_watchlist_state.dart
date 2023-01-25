part of 'movie_watchlist_bloc.dart';

abstract class MovieWatchlistState extends Equatable {
  const MovieWatchlistState();

  @override
  List<Object> get props => [];
}

class MovieWatchlistInitial extends MovieWatchlistState {}

class MovieWatchlistLoading extends MovieWatchlistState {
  @override
  List<Object> get props => [];
}

class MovieWatchlistError extends MovieWatchlistState {
  final String message;

  MovieWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieWatchlistLoaded extends MovieWatchlistState {
  final List<Movie> result;

  MovieWatchlistLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class MovieIsAddedToWatchlist extends MovieWatchlistState {
  final bool isAdded;

  MovieIsAddedToWatchlist(this.isAdded);

  @override
  List<Object> get props => [isAdded];
}

class MovieWatchlistMessage extends MovieWatchlistState {
  final String message;

  MovieWatchlistMessage(this.message);

  @override
  List<Object> get props => [message];
}