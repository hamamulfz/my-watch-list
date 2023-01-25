import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';

import 'package:core/domain/usecases/movie/get_movies_top_rated.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:movie/presentation/bloc/movie_top_rated/movie_top_rated_bloc.dart';
import 'movie_top_rated_bloc_test.mocks.dart';

@GenerateMocks([GetMoviesTopRated])
void main() {
  late MockGetMoviesTopRated usecase;
  late MovieTopRatedBloc bloc;

  setUp(() {
    usecase = MockGetMoviesTopRated();
    bloc = MovieTopRatedBloc(usecase);
  });

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  final tMovieList = <Movie>[tMovie];

  group(
    "Movie popular test - ",
    () {
      test('the initial state is initial empty', () {
        expect(bloc.state, MovieTopRatedInitial());
      });

      blocTest<MovieTopRatedBloc, MovieTopRatedState>(
        'when event is FetchMovieTopRated, should emit Data Loaded when fetched successfully',
        build: () {
          when(usecase.execute()).thenAnswer((_) async => Right(tMovieList));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchMovieTopRated()),
        expect: () => [
          MovieTopRatedLoading(),
          MovieTopRatedLoaded(tMovieList),
        ],
        verify: (bloc) {
          verify(usecase.execute());
          return FetchMovieTopRated().props;
        },
      );

      blocTest<MovieTopRatedBloc, MovieTopRatedState>(
        'when event is FetchMovieTopRated, should emit Data intial empty when fetched with empty data response',
        build: () {
          when(usecase.execute()).thenAnswer((_) async => const Right([]));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchMovieTopRated()),
        expect: () => [
          MovieTopRatedLoading(),
          MovieTopRatedInitial(),
        ],
      );

      blocTest<MovieTopRatedBloc, MovieTopRatedState>(
        'when event is FetchMovieTopRated, should emit Error when failed to fetched ',
        build: () {
          when(usecase.execute()).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchMovieTopRated()),
        expect: () => [
          MovieTopRatedLoading(),
          const MovieTopRatedError("Server Failure"),
        ],
      );
    },
  );
}
