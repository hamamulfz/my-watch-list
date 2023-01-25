import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/usecases/tv/get_tvs_now_playing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvsNowPlaying usecase;
  late MockTvShowRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvShowRepository();
    usecase = GetTvsNowPlaying(mockTvRepository);
  });

  final tTv = <TvShow>[];

  test('should get list of tv from the repository', () async {
    // arrange
    when(mockTvRepository.getNowPlayingTvShow())
        .thenAnswer((_) async => Right(tTv));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTv));
  });
}
