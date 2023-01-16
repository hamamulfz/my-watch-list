import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tv/get_tvs_now_playing.dart';
import 'package:ditonton/domain/usecases/tv/get_tvs_popular.dart';
import 'package:ditonton/domain/usecases/tv/get_tvs_top_rated.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv/tv_list_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_list_notifier_test.mocks.dart';

@GenerateMocks([
  GetTvsNowPlaying,
  GetTvsPopular,
  GetTvsTopRated,
])
void main() {
  late TvListNotifier provider;
  late MockGetTvsNowPlaying mockGetNowPlayingTvShow;
  late MockGetTvsPopular mockGetPopularTvShow;
  late MockGetTvsTopRated mockGetTopRatedTvs;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetNowPlayingTvShow = MockGetTvsNowPlaying();
    mockGetPopularTvShow = MockGetTvsPopular();
    mockGetTopRatedTvs = MockGetTvsTopRated();
    provider = TvListNotifier(
      getNowPlayingTvs: mockGetNowPlayingTvShow,
      getPopularTvs: mockGetPopularTvShow,
      getTopRatedTvs: mockGetTopRatedTvs,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tTvSho = TvShow(
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
      voteCount: 13507);
  final tTvShow = <TvShow>[tTvSho];

  group('now playing movies', () {
    test('initialState should be Empty', () {
      expect(provider.nowPlayingState, equals(RequestState.Empty));
    });

    test('should get data from the usecase', () async {
      // arrange
      when(mockGetNowPlayingTvShow.execute())
          .thenAnswer((_) async => Right(tTvShow));
      // act
      provider.fetchNowPlayingTvs();
      // assert
      verify(mockGetNowPlayingTvShow.execute());
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      when(mockGetNowPlayingTvShow.execute())
          .thenAnswer((_) async => Right(tTvShow));
      // act
      provider.fetchNowPlayingTvs();
      // assert
      expect(provider.nowPlayingState, RequestState.Loading);
    });

    test('should change movies when data is gotten successfully', () async {
      // arrange
      when(mockGetNowPlayingTvShow.execute())
          .thenAnswer((_) async => Right(tTvShow));
      // act
      await provider.fetchNowPlayingTvs();
      // assert
      expect(provider.nowPlayingState, RequestState.Loaded);
      expect(provider.nowPlayingTvs, tTvShow);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetNowPlayingTvShow.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchNowPlayingTvs();
      // assert
      expect(provider.nowPlayingState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('popular movies', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularTvShow.execute())
          .thenAnswer((_) async => Right(tTvShow));
      // act
      provider.fetchPopularTvs();
      // assert
      expect(provider.popularState, RequestState.Loading);
      // verify(provider.setState(RequestState.Loading));
    });

    test('should change movies data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetPopularTvShow.execute())
          .thenAnswer((_) async => Right(tTvShow));
      // act
      await provider.fetchPopularTvs();
      // assert
      expect(provider.popularState, RequestState.Loaded);
      expect(provider.popularTvs, tTvShow);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularTvShow.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchPopularTvs();
      // assert
      expect(provider.popularState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('top rated movies', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedTvs.execute())
          .thenAnswer((_) async => Right(tTvShow));
      // act
      provider.fetchTopRatedTvs();
      // assert
      expect(provider.topRatedState, RequestState.Loading);
    });

    test('should change movies data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTopRatedTvs.execute())
          .thenAnswer((_) async => Right(tTvShow));
      // act
      await provider.fetchTopRatedTvs();
      // assert
      expect(provider.topRatedState, RequestState.Loaded);
      expect(provider.topRated, tTvShow);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedTvs.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchTopRatedTvs();
      // assert
      expect(provider.topRatedState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
