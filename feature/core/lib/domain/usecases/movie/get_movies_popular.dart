import 'package:dartz/dartz.dart';
import 'package:core/common/utils/failure.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/repositories/movie_repository.dart';

class GetMoviesPopular {
  final MovieRepository repository;

  GetMoviesPopular(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getPopularMovies();
  }
}
