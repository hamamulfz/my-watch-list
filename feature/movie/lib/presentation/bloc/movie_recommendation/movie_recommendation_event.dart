part of 'movie_recommendation_bloc.dart';

abstract class MovieRecommendationEvent extends Equatable {
  const MovieRecommendationEvent();
}

class FetchMovieRecommendation extends MovieRecommendationEvent {
  final int id;

  const FetchMovieRecommendation(this.id);
  @override
  List<Object> get props => [id];
}
