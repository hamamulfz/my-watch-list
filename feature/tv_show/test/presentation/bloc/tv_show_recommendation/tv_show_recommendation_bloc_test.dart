import 'package:core/core.dart';

import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:tv_show/presentation/bloc/tv_show_popular/tv_show_popular_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_recommendation/tv_show_recommendation_bloc.dart';
import 'tv_show_recommendation_bloc_test.mocks.dart';

@GenerateMocks([GetTvRecommendations])
void main() {
  late MockGetTvRecommendations usecase;
  late TvShowRecommendationBloc bloc;

  setUp(() {
    usecase = MockGetTvRecommendations();
    bloc = TvShowRecommendationBloc(usecase);
  });

  const tTvShow = TvShow(
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
  group(
    "TvShow popular test - ",
    () {
      test('the initial state is initial empty', () {
        expect(bloc.state, TvShowRecommendationInitial());
      });

      blocTest<TvShowRecommendationBloc, TvShowRecommendationState>(
        'when event is FetchTvShowPopular, should emit Data Loaded when fetched successfully',
        build: () {
          when(usecase.execute(1)).thenAnswer((_) async => Right(tTvShowList));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchTvShowRecommendation(1)),
        expect: () => [
          TvShowRecommendationLoading(),
          TvShowRecommendationLoaded(tTvShowList),
        ],
        verify: (bloc) {
          verify(usecase.execute(1));
          return FetchTvShowPopular().props;
        },
      );

      blocTest<TvShowRecommendationBloc, TvShowRecommendationState>(
        'when event is FetchTvShowPopular, should emit Data intial empty when fetched with empty data response',
        build: () {
          when(usecase.execute(1)).thenAnswer((_) async => const Right([]));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchTvShowRecommendation(1)),
        expect: () => [
          TvShowRecommendationLoading(),
          TvShowRecommendationInitial(),
        ],
      );

      blocTest<TvShowRecommendationBloc, TvShowRecommendationState>(
        'when event is FetchTvShowPopular, should emit Error when failed to fetched ',
        build: () {
          when(usecase.execute(1)).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchTvShowRecommendation(1)),
        expect: () => [
          TvShowRecommendationLoading(),
          TvShowRecommendationError("Server Failure"),
        ],
      );
    },
  );
}
