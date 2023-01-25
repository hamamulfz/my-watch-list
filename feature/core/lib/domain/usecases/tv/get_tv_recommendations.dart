import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/common/utils/failure.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';

class GetTvRecommendations {
  final TvShowRepository repository;

  GetTvRecommendations(this.repository);

  Future<Either<Failure, List<TvShow>>> execute(id) {
    return repository.getRecommendationsTvShow(id);
  }
}
