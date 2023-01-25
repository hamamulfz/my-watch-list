part of 'movie_popular_bloc.dart';

abstract class MoviePopularState extends Equatable {
  const MoviePopularState();
  
  @override
  List<Object> get props => [];
}

class MoviePopularInitial extends MoviePopularState {}

class MoviePopularLoading extends MoviePopularState {
  @override
  List<Object> get props => [];
}

class MoviePopularError extends MoviePopularState {
  final String message;

  MoviePopularError(this.message);

  @override
  List<Object> get props => [message];
}

class MoviePopularLoaded extends MoviePopularState {
  final List<Movie> result;

  MoviePopularLoaded(this.result);

  @override
  List<Object> get props => [result];
}
