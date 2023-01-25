part of 'movie_now_playing_bloc.dart';

abstract class MovieNowPlayingEvent extends Equatable {}

class FetchMovieNowPlaying extends MovieNowPlayingEvent {
  @override
  List<Object> get props => [];
}
