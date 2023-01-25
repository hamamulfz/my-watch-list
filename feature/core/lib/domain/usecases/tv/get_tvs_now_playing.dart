import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/common/utils/failure.dart';

import '../../repositories/tv_show_repository.dart';

class GetTvsNowPlaying {
  final TvShowRepository repository;

  GetTvsNowPlaying(this.repository);

  Future<Either<Failure, List<TvShow>>> execute() {
    return repository.getNowPlayingTvShow();
  }
}
