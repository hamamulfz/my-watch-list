import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/tv/get_tvs_top_rated.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvsTopRated usecase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    usecase = GetTvsTopRated(mockTvShowRepository);
  });

  final tTvShow = <TvShow>[];

  test('should get list of movies from repository', () async {
    // arrange
    when(mockTvShowRepository.getTopRatedTvShow())
        .thenAnswer((_) async => Right(tTvShow));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTvShow));
  });
}
