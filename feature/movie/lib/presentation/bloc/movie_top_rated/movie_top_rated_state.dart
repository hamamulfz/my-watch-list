part of 'movie_top_rated_bloc.dart';

abstract class MovieTopRatedState extends Equatable {
  const MovieTopRatedState();
  
  @override
  List<Object> get props => [];
}

class MovieTopRatedInitial extends MovieTopRatedState {}

class MovieTopRatedLoading extends MovieTopRatedState {
  @override
  List<Object> get props => [];
}

class MovieTopRatedError extends MovieTopRatedState {
  final String message;

  const MovieTopRatedError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieTopRatedLoaded extends MovieTopRatedState {
  final List<Movie> result;

  const MovieTopRatedLoaded(this.result);

  @override
  List<Object> get props => [result];
}
