import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/movie/get_movies_popular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetMoviesPopular usecase;
  late MockMovieRepository mockMovieRpository;

  setUp(() {
    mockMovieRpository = MockMovieRepository();
    usecase = GetMoviesPopular(mockMovieRpository);
  });

  final tMovies = <Movie>[];

  group('GetPopularMovies Tests', () {
    group('execute', () {
      test(
          'should get list of movies from the repository when execute function is called',
          () async {
        // arrange
        when(mockMovieRpository.getPopularMovies())
            .thenAnswer((_) async => Right(tMovies));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tMovies));
      });
    });
  });
}
