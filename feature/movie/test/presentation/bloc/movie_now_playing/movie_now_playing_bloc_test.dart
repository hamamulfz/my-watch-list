import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/movie/get_movies_now_playing.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:movie/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'movie_now_playing_bloc_test.mocks.dart';

@GenerateMocks([GetMoviesNowPlaying])
void main() {
  late MockGetMoviesNowPlaying usecase;
  late MovieNowPlayingBloc bloc;

  setUp(() {
    usecase = MockGetMoviesNowPlaying();
    bloc = MovieNowPlayingBloc(usecase);
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
    "Movie NowPlaying test - ",
    () {
      test('the initial state is initial empty', () {
        expect(bloc.state, MovieNowPlayingInitial());
      });

      blocTest<MovieNowPlayingBloc, MovieNowPlayingState>(
        'when event is FetchMoviePopular, should emit Data Loaded when fetched successfully',
        build: () {
          when(usecase.execute()).thenAnswer((_) async => Right(tMovieList));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchMovieNowPlaying()),
        expect: () => [
          MovieNowPlayingLoading(),
          MovieNowPlayingLoaded(tMovieList),
        ],
        verify: (bloc) {
          verify(usecase.execute());
          return FetchMoviePopular().props;
        },
      );

      blocTest<MovieNowPlayingBloc, MovieNowPlayingState>(
        'when event is FetchMoviePopular, should emit Data intial empty when fetched with empty data response',
        build: () {
          when(usecase.execute()).thenAnswer((_) async => const Right([]));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchMovieNowPlaying()),
        expect: () => [
          MovieNowPlayingLoading(),
          MovieNowPlayingInitial(),
        ],
      );

      blocTest<MovieNowPlayingBloc, MovieNowPlayingState>(
        'when event is FetchMoviePopular, should emit Error when failed to fetched ',
        build: () {
          when(usecase.execute()).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchMovieNowPlaying()),
        expect: () => [
          MovieNowPlayingLoading(),
          MovieNowPlayingError("Server Failure"),
        ],
      );
    },
  );
}
