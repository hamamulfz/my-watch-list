import 'package:dartz/dartz.dart';
import 'package:core/common/utils/failure.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';

class SearchTv {
  final TvShowRepository repository;

  SearchTv(this.repository);

  Future<Either<Failure, List<TvShow>>> execute(String query) {
    return repository.searchTvShow(query);
  }
}
