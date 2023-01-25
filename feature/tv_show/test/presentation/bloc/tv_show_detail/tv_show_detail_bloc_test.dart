import 'package:core/core.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/season.dart';
import 'package:core/domain/entities/tv_show_detail.dart';
import 'package:core/domain/usecases/tv/get_tv_detail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:tv_show/presentation/bloc/tv_show_detail/tv_show_detail_bloc.dart';
import 'tv_show_detail_bloc_test.mocks.dart';

@GenerateMocks([GetTvDetail])
void main() {
  late MockGetTvDetail usecase;
  late TvShowDetailBloc bloc;

  setUp(() {
    usecase = MockGetTvDetail();
    bloc = TvShowDetailBloc(usecase);
  });

const testTvDetail = TVShowDetail(
  seasons: [
    Season(
      id: 1,
      posterPath: "posterPath",
      seasonNumber: 1,
      episodeCount: 12,
    )
  ],
  numberOfSeasons: 1,
  episodeRunTime: [1],
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  // originalName: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  firstAirDate: 'releaseDate',
  numberOfEpisodes: 1,
  name: 'title',
  voteAverage: 1,
  voteCount: 1,
);


  group(
    "TvShow NowPlaying test - ",
    () {
      test('the initial state is initial empty', () {
        expect(bloc.state, TvShowDetailInitial());
      });

      blocTest<TvShowDetailBloc, TvShowDetailState>(
        'when event is FetchTvShowPopular, should emit Data Loaded when fetched successfully',
        build: () {
          when(usecase.execute(1)).thenAnswer((_) async => const Right(testTvDetail));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchTvShowDetail(1)),
        expect: () => [
          TvShowDetailLoading(),
          const TvShowDetailLoaded(testTvDetail),
        ],
        verify: (bloc) {
          verify(usecase.execute(1));
          return FetchTvShowDetail(1).props;
        },
      );

      blocTest<TvShowDetailBloc, TvShowDetailState>(
        'when event is FetchTvShowPopular, should emit Error when failed to fetched ',
        build: () {
          when(usecase.execute(1)).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchTvShowDetail(1)),
        expect: () => [
          TvShowDetailLoading(),
          const TvShowDetailError("Server Failure"),
        ],
      );
    },
  );
}
