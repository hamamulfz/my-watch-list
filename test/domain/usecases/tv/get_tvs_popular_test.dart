import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/tv/get_tvs_popular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvsPopular usecase;
  late MockTvShowRepository mockTvShowRpository;

  setUp(() {
    mockTvShowRpository = MockTvShowRepository();
    usecase = GetTvsPopular(mockTvShowRpository);
  });

  final tTvShow = <TvShow>[];

  group('GetPopularTvShows Tests', () {
    group('execute', () {
      test(
          'should get list of TvShows from the repository when execute function is called',
          () async {
        // arrange
        when(mockTvShowRpository.getPopularTvShow())
            .thenAnswer((_) async => Right(tTvShow));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tTvShow));
      });
    });
  });
}
