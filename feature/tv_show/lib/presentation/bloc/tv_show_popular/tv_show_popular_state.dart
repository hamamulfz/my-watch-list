part of 'tv_show_popular_bloc.dart';

abstract class TvShowPopularState extends Equatable {
  const TvShowPopularState();
  
  @override
  List<Object> get props => [];
}

class TvShowPopularInitial extends TvShowPopularState {}

class TvShowPopularLoading extends TvShowPopularInitial {
  @override
  List<Object> get props => [];
}

class TvShowPopularError extends TvShowPopularInitial {
  final String message;

  TvShowPopularError(this.message);

  @override
  List<Object> get props => [message];
}

class TvShowPopularLoaded extends TvShowPopularInitial {
  final List<TvShow> result;

  TvShowPopularLoaded(this.result);

  @override
  List<Object> get props => [result];
}
