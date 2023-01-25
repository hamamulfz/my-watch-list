import 'package:core/core.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/usecases/tv/get_tvs_top_rated.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:tv_show/presentation/bloc/tv_show_top_rated/tv_show_top_rated_bloc.dart';

import 'tv_show_top_rated_bloc_test.mocks.dart';


@GenerateMocks([GetTvsTopRated])
void main() {
  late MockGetTvsTopRated usecase;
  late TvShowTopRatedBloc bloc;

  setUp(() {
    usecase = MockGetTvsTopRated();
    bloc = TvShowTopRatedBloc(usecase);
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
        expect(bloc.state, TvShowTopRatedInitial());
      });

      blocTest<TvShowTopRatedBloc, TvShowTopRatedState>(
        'when event is FetchTvShowTopRated, should emit Data Loaded when fetched successfully',
        build: () {
          when(usecase.execute()).thenAnswer((_) async => Right(tTvShowList));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchTvShowTopRated()),
        expect: () => [
          TvShowTopRatedLoading(),
          TvShowTopRatedLoaded(tTvShowList),
        ],
        verify: (bloc) {
          verify(usecase.execute());
          return FetchTvShowTopRated().props;
        },
      );

      blocTest<TvShowTopRatedBloc, TvShowTopRatedState>(
        'when event is FetchTvShowTopRated, should emit Data intial empty when fetched with empty data response',
        build: () {
          when(usecase.execute()).thenAnswer((_) async => const Right([]));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchTvShowTopRated()),
        expect: () => [
          TvShowTopRatedLoading(),
          TvShowTopRatedInitial(),
        ],
      );

      blocTest<TvShowTopRatedBloc, TvShowTopRatedState>(
        'when event is FetchTvShowTopRated, should emit Error when failed to fetched ',
        build: () {
          when(usecase.execute()).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchTvShowTopRated()),
        expect: () => [
          TvShowTopRatedLoading(),
          const TvShowTopRatedError("Server Failure"),
        ],
      );
    },
  );
}
