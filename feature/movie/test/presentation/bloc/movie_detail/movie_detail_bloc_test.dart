import 'package:core/core.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:core/domain/usecases/movie/get_movie_detail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'movie_detail_bloc_test.mocks.dart';

@GenerateMocks([GetMovieDetail])
void main() {
  late MockGetMovieDetail usecase;
  late MovieDetailBloc bloc;

  setUp(() {
    usecase = MockGetMovieDetail();
    bloc = MovieDetailBloc(usecase);
  });

  const testMovieDetail = MovieDetail(
    adult: false,
    backdropPath: 'backdropPath',
    genres: [Genre(id: 1, name: 'Action')],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    runtime: 120,
    title: 'title',
    voteAverage: 1,
    voteCount: 1,
  );

  group(
    "Movie NowPlaying test - ",
    () {
      test('the initial state is initial empty', () {
        expect(bloc.state, MovieDetailInitial());
      });

      blocTest<MovieDetailBloc, MovieDetailState>(
        'when event is FetchMoviePopular, should emit Data Loaded when fetched successfully',
        build: () {
          when(usecase.execute(1)).thenAnswer((_) async => const Right(testMovieDetail));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchMovieDetail(1)),
        expect: () => [
          MovieDetailLoading(),
          MovieDetailLoaded(testMovieDetail),
        ],
        verify: (bloc) {
          verify(usecase.execute(1));
          return FetchMoviePopular().props;
        },
      );

      blocTest<MovieDetailBloc, MovieDetailState>(
        'when event is FetchMoviePopular, should emit Error when failed to fetched ',
        build: () {
          when(usecase.execute(1)).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchMovieDetail(1)),
        expect: () => [
          MovieDetailLoading(),
          MovieDetailError("Server Failure"),
        ],
      );
    },
  );
}
