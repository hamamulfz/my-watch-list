import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv_show_detail.dart';
import 'package:core/common/utils/failure.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';

class GetTvDetail {
  final TvShowRepository repository;

  GetTvDetail(this.repository);

  Future<Either<Failure, TVShowDetail>> execute(int id) {
    return repository.getDetailTvShow(id);
  }
}
