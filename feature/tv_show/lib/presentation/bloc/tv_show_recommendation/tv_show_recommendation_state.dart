part of 'tv_show_recommendation_bloc.dart';

abstract class TvShowRecommendationState extends Equatable {
  const TvShowRecommendationState();
  
  @override
  List<Object> get props => [];
}

class TvShowRecommendationInitial extends TvShowRecommendationState {}

class TvShowRecommendationLoading extends TvShowRecommendationInitial {
  @override
  List<Object> get props => [];
}

class TvShowRecommendationError extends TvShowRecommendationInitial {
  final String message;

  TvShowRecommendationError(this.message);

  @override
  List<Object> get props => [message];
}

class TvShowRecommendationLoaded extends TvShowRecommendationInitial {
  final List<TvShow> result;

  TvShowRecommendationLoaded(this.result);

  @override
  List<Object> get props => [result];
}
