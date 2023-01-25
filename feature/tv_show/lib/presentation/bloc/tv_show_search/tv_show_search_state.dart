part of 'tv_show_search_bloc.dart';

abstract class TvShowSearchState extends Equatable {
  const TvShowSearchState();
  
  @override
  List<Object> get props => [];
}

class TvShowSearchInitial extends TvShowSearchState {}

class TvShowSearchEmpty extends TvShowSearchState {
  @override
  List<Object> get props => [];
}

class TvShowSearchLoading extends TvShowSearchState {
  @override
  List<Object> get props => [];
}

class TvShowSearchError extends TvShowSearchState {
  final String message;

  const TvShowSearchError(this.message);

  @override
  List<Object> get props => [message];
}

class TvShowSearchLoaded extends TvShowSearchState {
  final List<TvShow> result;

  const TvShowSearchLoaded(this.result);

  @override
  List<Object> get props => [result];
}
