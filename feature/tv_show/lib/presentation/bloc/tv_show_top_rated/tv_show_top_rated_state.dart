part of 'tv_show_top_rated_bloc.dart';

abstract class TvShowTopRatedState extends Equatable {
  const TvShowTopRatedState();
  
  @override
  List<Object> get props => [];
}

class TvShowTopRatedInitial extends TvShowTopRatedState {}

class TvShowTopRatedLoading extends TvShowTopRatedState {
  @override
  List<Object> get props => [];
}

class TvShowTopRatedError extends TvShowTopRatedState {
  final String message;

  const TvShowTopRatedError(this.message);

  @override
  List<Object> get props => [message];
}

class TvShowTopRatedLoaded extends TvShowTopRatedState {
  final List<TvShow> result;

  const TvShowTopRatedLoaded(this.result);

  @override
  List<Object> get props => [result];
}
