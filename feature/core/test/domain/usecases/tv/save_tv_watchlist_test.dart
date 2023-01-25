import 'package:dartz/dartz.dart';
import 'package:core/domain/usecases/tv/save_tv_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late SaveTvWatchlist usecase;
  late MockTvShowRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockTvShowRepository();
    usecase = SaveTvWatchlist(mockMovieRepository);
  });

  test('should save movie to the repository', () async {
    // arrange
    when(mockMovieRepository.saveWatchlistTvShow(testTvDetail))
        .thenAnswer((_) async => const Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(testTvDetail);
    // assert
    verify(mockMovieRepository.saveWatchlistTvShow(testTvDetail));
    expect(result, const Right('Added to Watchlist'));
  });
}
