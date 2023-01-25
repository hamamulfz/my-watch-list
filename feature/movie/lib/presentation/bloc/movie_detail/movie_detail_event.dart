part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {}

class FetchMovieDetail extends MovieDetailEvent {
   FetchMovieDetail(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}
