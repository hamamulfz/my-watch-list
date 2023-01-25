import 'package:dartz/dartz.dart';
import 'package:core/domain/usecases/tv/remove_tv_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveTvWatchlist usecase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    usecase = RemoveTvWatchlist(mockTvShowRepository);
  });

  test('should remove watchlist tvShow from repository', () async {
    // arrange
    when(mockTvShowRepository.removeWatchlistTvShow(testTvDetail))
        .thenAnswer((_) async => const Right('Removed from watchlist'));
    // act
    final result = await usecase.execute(testTvDetail);
    // assert
    verify(mockTvShowRepository.removeWatchlistTvShow(testTvDetail));
    expect(result, const Right('Removed from watchlist'));
  });
}
