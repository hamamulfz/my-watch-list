import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/common/utils/failure.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';

class GetTvWatchlist {
  final TvShowRepository _repository;

  GetTvWatchlist(this._repository);

  Future<Either<Failure, List<TvShow>>> execute() {
    return _repository.getWatchlistTvShow();
  }
}
