import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/tv/get_tvs_top_rated.dart';
import 'package:ditonton/presentation/provider/tv/tv_top_rated_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_list_notifier_test.mocks.dart';

@GenerateMocks([GetTvsTopRated])
void main() {
  late MockGetTvsTopRated mockGetTopRatedTvShow;
  late TvTopRatedNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTopRatedTvShow = MockGetTvsTopRated();
    notifier = TvTopRatedNotifier(getTopRatedTvs: mockGetTopRatedTvShow)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  final tTvShow = TvShow(
    originCountry: [""],
    originalLanguage: "",
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalName: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    firstAirDate: '2002-05-01',
    name: 'Spider-Man',
    voteAverage: 7.2,
    voteCount: 13507,
  );

  final tTvShowList = <TvShow>[tTvShow];
  group("Top Rated Tv", () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedTvShow.execute())
          .thenAnswer((_) async => Right(tTvShowList));
      // act
      notifier.fetchTopRatedTv();
      // assert
      expect(notifier.state, RequestState.Loading);
      expect(listenerCallCount, 1);
    });

    test('should change movies data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTopRatedTvShow.execute())
          .thenAnswer((_) async => Right(tTvShowList));
      // act
      await notifier.fetchTopRatedTv();
      // assert
      expect(notifier.state, RequestState.Loaded);
      expect(notifier.movies, tTvShowList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedTvShow.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await notifier.fetchTopRatedTv();
      // assert
      expect(notifier.state, RequestState.Error);
      expect(notifier.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
