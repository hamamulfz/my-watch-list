import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetTvDetail {
  final TvShowRepository repository;

  GetTvDetail(this.repository);

  Future<Either<Failure, TVShowDetail>> execute(int id) {
    return repository.getDetailTvShow(id);
  }
}
