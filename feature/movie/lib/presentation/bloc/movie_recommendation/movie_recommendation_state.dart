part of 'movie_recommendation_bloc.dart';

abstract class MovieRecommendationState extends Equatable {
  const MovieRecommendationState();
  
  @override
  List<Object> get props => [];
}

class MovieRecommendationInitial extends MovieRecommendationState {}

class MovieRecommendationLoading extends MovieRecommendationState {
  @override
  List<Object> get props => [];
}

class MovieRecommendationError extends MovieRecommendationState {
  final String message;

  MovieRecommendationError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieRecommendationLoaded extends MovieRecommendationState {
  final List<Movie> result;

  MovieRecommendationLoaded(this.result);

  @override
  List<Object> get props => [result];
}
