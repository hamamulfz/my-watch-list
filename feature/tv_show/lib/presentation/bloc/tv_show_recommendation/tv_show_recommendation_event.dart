part of 'tv_show_recommendation_bloc.dart';

abstract class TvShowRecommendationEvent extends Equatable {

}

class FetchTvShowRecommendation extends TvShowRecommendationEvent {
  final int id;

  FetchTvShowRecommendation(this.id);

  @override
  List<Object> get props => [id];
}
