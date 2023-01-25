part of 'movie_search_bloc.dart';

abstract class MovieSearchEvent extends Equatable {}

class OnQueryMoviesChange extends MovieSearchEvent {
  final String query;

  OnQueryMoviesChange(this.query);

  @override
  List<Object> get props => [query];
}
