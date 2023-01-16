import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/tv/get_tvs_popular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvsPopular usecase;
  late MockTvShowRepository mockTvRpository;

  setUp(() {
    mockTvRpository = MockTvShowRepository();
    usecase = GetTvsPopular(mockTvRpository);
  });

  final tMovies = <TvShow>[];

  group('GetPopularMovies Tests', () {
    group('execute', () {
      test(
          'should get list of tv from the repository when execute function is called',
          () async {
        // arrange
        when(mockTvRpository.getPopularTvShow())
            .thenAnswer((_) async => Right(tMovies));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tMovies));
      });
    });
  });
}
