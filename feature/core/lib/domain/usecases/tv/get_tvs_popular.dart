import 'package:dartz/dartz.dart';
import 'package:core/common/utils/failure.dart';
import 'package:core/domain/entities/tv_show.dart';

import '../../repositories/tv_show_repository.dart';

class GetTvsPopular {
  final TvShowRepository repository;

  GetTvsPopular(this.repository);

  Future<Either<Failure, List<TvShow>>> execute() {
    return repository.getPopularTvShow();
  }
}
