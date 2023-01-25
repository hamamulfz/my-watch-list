part of 'movie_now_playing_bloc.dart';

abstract class MovieNowPlayingState extends Equatable {}

class MovieNowPlayingInitial extends MovieNowPlayingState {
  @override
  List<Object> get props => [];
}

class MovieNowPlayingLoading extends MovieNowPlayingState {
  @override
  List<Object> get props => [];
}

class MovieNowPlayingError extends MovieNowPlayingState {
  final String message;

  MovieNowPlayingError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieNowPlayingLoaded extends MovieNowPlayingState {
  final List<Movie> result;

  MovieNowPlayingLoaded(this.result);

  @override
  List<Object> get props => [result];
}
