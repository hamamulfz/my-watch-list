import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

import '../../entities/tv_show.dart';

class GetTvsTopRated {
  final TvShowRepository repository;

  GetTvsTopRated(this.repository);

  Future<Either<Failure, List<TvShow>>> execute() {
    return repository.getTopRatedTvShow();
  }
}
