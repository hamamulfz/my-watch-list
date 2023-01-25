import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:movie/presentation/bloc/movie_recommendation/movie_recommendation_bloc.dart';
import 'movie_recommendation_bloc_test.mocks.dart';

@GenerateMocks([GetMovieRecommendations])
void main() {
  late MockGetMovieRecommendations usecase;
  late MovieRecommendationBloc bloc;

  setUp(() {
    usecase = MockGetMovieRecommendations();
    bloc = MovieRecommendationBloc(usecase);
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
        expect(bloc.state, MovieRecommendationInitial());
      });

      blocTest<MovieRecommendationBloc, MovieRecommendationState>(
        'when event is FetchMoviePopular, should emit Data Loaded when fetched successfully',
        build: () {
          when(usecase.execute(1)).thenAnswer((_) async => Right(tMovieList));
          return bloc;
        },
        act: (bloc) => bloc.add(const FetchMovieRecommendation(1)),
        expect: () => [
          MovieRecommendationLoading(),
          MovieRecommendationLoaded(tMovieList),
        ],
        verify: (bloc) {
          verify(usecase.execute(1));
          return FetchMoviePopular().props;
        },
      );

      blocTest<MovieRecommendationBloc, MovieRecommendationState>(
        'when event is FetchMoviePopular, should emit Data intial empty when fetched with empty data response',
        build: () {
          when(usecase.execute(1)).thenAnswer((_) async => const Right([]));
          return bloc;
        },
        act: (bloc) => bloc.add(const FetchMovieRecommendation(1)),
        expect: () => [
          MovieRecommendationLoading(),
          MovieRecommendationInitial(),
        ],
      );

      blocTest<MovieRecommendationBloc, MovieRecommendationState>(
        'when event is FetchMoviePopular, should emit Error when failed to fetched ',
        build: () {
          when(usecase.execute(1)).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return bloc;
        },
        act: (bloc) => bloc.add(const FetchMovieRecommendation(1)),
        expect: () => [
          MovieRecommendationLoading(),
          const MovieRecommendationError("Server Failure"),
        ],
      );
    },
  );
}
