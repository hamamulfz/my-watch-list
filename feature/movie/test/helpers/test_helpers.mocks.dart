// Mocks generated by Mockito 5.3.2 from annotations
// in movie/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i25;
import 'dart:typed_data' as _i26;

import 'package:core/common/utils/failure.dart' as _i9;
import 'package:core/common/utils/network_info.dart' as _i24;
import 'package:core/data/datasources/db/database_helper.dart' as _i23;
import 'package:core/data/datasources/movie_local_data_source.dart' as _i14;
import 'package:core/data/datasources/movie_remote_data_source.dart' as _i12;
import 'package:core/data/datasources/tv_local_data_source.dart' as _i21;
import 'package:core/data/datasources/tv_remote_data_source.dart' as _i19;
import 'package:core/data/models/movie_detail_response.dart' as _i3;
import 'package:core/data/models/movie_model.dart' as _i13;
import 'package:core/data/models/movie_table.dart' as _i15;
import 'package:core/data/models/tv_show_detail_response.dart' as _i4;
import 'package:core/data/models/tv_show_model.dart' as _i20;
import 'package:core/data/models/tv_show_table.dart' as _i22;
import 'package:core/domain/entities/movie.dart' as _i10;
import 'package:core/domain/entities/movie_detail.dart' as _i11;
import 'package:core/domain/entities/tv_show.dart' as _i17;
import 'package:core/domain/entities/tv_show_detail.dart' as _i18;
import 'package:core/domain/repositories/movie_repository.dart' as _i7;
import 'package:core/domain/repositories/tv_show_repository.dart' as _i16;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieDetailResponse_1 extends _i1.SmartFake
    implements _i3.MovieDetailResponse {
  _FakeMovieDetailResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTVShowDetailResponse_2 extends _i1.SmartFake
    implements _i4.TVShowDetailResponse {
  _FakeTVShowDetailResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDatabase_3 extends _i1.SmartFake implements _i5.Database {
  _FakeDatabase_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_4 extends _i1.SmartFake implements _i6.Response {
  _FakeResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_5 extends _i1.SmartFake
    implements _i6.StreamedResponse {
  _FakeStreamedResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i7.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getNowPlayingMovies,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i11.MovieDetail>> getDetailMovie(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDetailMovie,
          [id],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, _i11.MovieDetail>>.value(
                _FakeEither_0<_i9.Failure, _i11.MovieDetail>(
          this,
          Invocation.method(
            #getDetailMovie,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i11.MovieDetail>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getRecommendationsMovie(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRecommendationsMovie,
          [id],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getRecommendationsMovie,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> saveWatchlistMovie(
          _i11.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlistMovie,
          [movie],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlistMovie,
            [movie],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> removeWatchlistMovie(
          _i11.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistMovie,
          [movie],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlistMovie,
            [movie],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<bool> isAddedToWatchlistMovie(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlistMovie,
          [id],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getWatchlistMovies,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i12.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<List<_i13.MovieModel>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue:
            _i8.Future<List<_i13.MovieModel>>.value(<_i13.MovieModel>[]),
      ) as _i8.Future<List<_i13.MovieModel>>);
  @override
  _i8.Future<List<_i13.MovieModel>> getPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue:
            _i8.Future<List<_i13.MovieModel>>.value(<_i13.MovieModel>[]),
      ) as _i8.Future<List<_i13.MovieModel>>);
  @override
  _i8.Future<List<_i13.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue:
            _i8.Future<List<_i13.MovieModel>>.value(<_i13.MovieModel>[]),
      ) as _i8.Future<List<_i13.MovieModel>>);
  @override
  _i8.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i8.Future<_i3.MovieDetailResponse>.value(
            _FakeMovieDetailResponse_1(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i3.MovieDetailResponse>);
  @override
  _i8.Future<List<_i13.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue:
            _i8.Future<List<_i13.MovieModel>>.value(<_i13.MovieModel>[]),
      ) as _i8.Future<List<_i13.MovieModel>>);
  @override
  _i8.Future<List<_i13.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue:
            _i8.Future<List<_i13.MovieModel>>.value(<_i13.MovieModel>[]),
      ) as _i8.Future<List<_i13.MovieModel>>);
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i14.MovieLocalDataSource {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<String> insertWatchlist(_i15.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [movie],
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<String> removeWatchlist(_i15.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i15.MovieTable?> getMovieById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getMovieById,
          [id],
        ),
        returnValue: _i8.Future<_i15.MovieTable?>.value(),
      ) as _i8.Future<_i15.MovieTable?>);
  @override
  _i8.Future<List<_i15.MovieTable>> getWatchlistMovies() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue:
            _i8.Future<List<_i15.MovieTable>>.value(<_i15.MovieTable>[]),
      ) as _i8.Future<List<_i15.MovieTable>>);
  @override
  _i8.Future<void> cacheNowPlayingMovies(List<_i15.MovieTable>? movies) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheNowPlayingMovies,
          [movies],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<List<_i15.MovieTable>> getCachedNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedNowPlayingMovies,
          [],
        ),
        returnValue:
            _i8.Future<List<_i15.MovieTable>>.value(<_i15.MovieTable>[]),
      ) as _i8.Future<List<_i15.MovieTable>>);
}

/// A class which mocks [TvShowRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvShowRepository extends _i1.Mock implements _i16.TvShowRepository {
  MockTvShowRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>>
      getNowPlayingTvShow() => (super.noSuchMethod(
            Invocation.method(
              #getNowPlayingTvShow,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i17.TvShow>>(
              this,
              Invocation.method(
                #getNowPlayingTvShow,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>> getPopularTvShow() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTvShow,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>>.value(
                _FakeEither_0<_i9.Failure, List<_i17.TvShow>>(
          this,
          Invocation.method(
            #getPopularTvShow,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>> getTopRatedTvShow() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvShow,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>>.value(
                _FakeEither_0<_i9.Failure, List<_i17.TvShow>>(
          this,
          Invocation.method(
            #getTopRatedTvShow,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i18.TVShowDetail>> getDetailTvShow(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDetailTvShow,
          [id],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, _i18.TVShowDetail>>.value(
                _FakeEither_0<_i9.Failure, _i18.TVShowDetail>(
          this,
          Invocation.method(
            #getDetailTvShow,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i18.TVShowDetail>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>>
      getRecommendationsTvShow(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getRecommendationsTvShow,
              [id],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i17.TvShow>>(
              this,
              Invocation.method(
                #getRecommendationsTvShow,
                [id],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>> searchTvShow(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvShow,
          [query],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>>.value(
                _FakeEither_0<_i9.Failure, List<_i17.TvShow>>(
          this,
          Invocation.method(
            #searchTvShow,
            [query],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> saveWatchlistTvShow(
          _i18.TVShowDetail? tvShow) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlistTvShow,
          [tvShow],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlistTvShow,
            [tvShow],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> removeWatchlistTvShow(
          _i18.TVShowDetail? tvShow) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTvShow,
          [tvShow],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlistTvShow,
            [tvShow],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<bool> isAddedToWatchlistTvShow(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlistTvShow,
          [id],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>> getWatchlistTvShow() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvShow,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>>.value(
                _FakeEither_0<_i9.Failure, List<_i17.TvShow>>(
          this,
          Invocation.method(
            #getWatchlistTvShow,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i17.TvShow>>>);
}

/// A class which mocks [TvRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRemoteDataSource extends _i1.Mock
    implements _i19.TvRemoteDataSource {
  MockTvRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<List<_i20.TVShowModel>> getNowPlayingTvs() => (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingTvs,
          [],
        ),
        returnValue:
            _i8.Future<List<_i20.TVShowModel>>.value(<_i20.TVShowModel>[]),
      ) as _i8.Future<List<_i20.TVShowModel>>);
  @override
  _i8.Future<List<_i20.TVShowModel>> getPopularTvs() => (super.noSuchMethod(
        Invocation.method(
          #getPopularTvs,
          [],
        ),
        returnValue:
            _i8.Future<List<_i20.TVShowModel>>.value(<_i20.TVShowModel>[]),
      ) as _i8.Future<List<_i20.TVShowModel>>);
  @override
  _i8.Future<List<_i20.TVShowModel>> getTopRatedTvs() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvs,
          [],
        ),
        returnValue:
            _i8.Future<List<_i20.TVShowModel>>.value(<_i20.TVShowModel>[]),
      ) as _i8.Future<List<_i20.TVShowModel>>);
  @override
  _i8.Future<_i4.TVShowDetailResponse> getDetailTvs(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDetailTvs,
          [id],
        ),
        returnValue: _i8.Future<_i4.TVShowDetailResponse>.value(
            _FakeTVShowDetailResponse_2(
          this,
          Invocation.method(
            #getDetailTvs,
            [id],
          ),
        )),
      ) as _i8.Future<_i4.TVShowDetailResponse>);
  @override
  _i8.Future<List<_i20.TVShowModel>> getRecommendationsTvs(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRecommendationsTvs,
          [id],
        ),
        returnValue:
            _i8.Future<List<_i20.TVShowModel>>.value(<_i20.TVShowModel>[]),
      ) as _i8.Future<List<_i20.TVShowModel>>);
  @override
  _i8.Future<List<_i20.TVShowModel>> searchTvs(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvs,
          [query],
        ),
        returnValue:
            _i8.Future<List<_i20.TVShowModel>>.value(<_i20.TVShowModel>[]),
      ) as _i8.Future<List<_i20.TVShowModel>>);
}

/// A class which mocks [TvLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvLocalDataSource extends _i1.Mock implements _i21.TvLocalDataSource {
  MockTvLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<String> insertWatchlist(_i22.TVShowTable? tvShow) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [tvShow],
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<String> removeWatchlist(_i22.TVShowTable? tvShow) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [tvShow],
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i22.TVShowTable?> getTvById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvById,
          [id],
        ),
        returnValue: _i8.Future<_i22.TVShowTable?>.value(),
      ) as _i8.Future<_i22.TVShowTable?>);
  @override
  _i8.Future<List<_i22.TVShowTable>> getWatchlistTvs() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvs,
          [],
        ),
        returnValue:
            _i8.Future<List<_i22.TVShowTable>>.value(<_i22.TVShowTable>[]),
      ) as _i8.Future<List<_i22.TVShowTable>>);
  @override
  _i8.Future<void> cacheNowPlayingTvs(List<_i22.TVShowTable>? tvShows) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheNowPlayingTvs,
          [tvShows],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<List<_i22.TVShowTable>> getCachedNowPlayingTvs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedNowPlayingTvs,
          [],
        ),
        returnValue:
            _i8.Future<List<_i22.TVShowTable>>.value(<_i22.TVShowTable>[]),
      ) as _i8.Future<List<_i22.TVShowTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i23.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set db(_i5.Database? _db) => super.noSuchMethod(
        Invocation.setter(
          #db,
          _db,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<_i5.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i8.Future<_i5.Database?>.value(),
      ) as _i8.Future<_i5.Database?>);
  @override
  _i8.Future<dynamic> initialize(String? path) => (super.noSuchMethod(
        Invocation.method(
          #initialize,
          [path],
        ),
        returnValue: _i8.Future<dynamic>.value(),
      ) as _i8.Future<dynamic>);
  @override
  _i8.Future<_i5.Database> initDb([dynamic otherPath]) => (super.noSuchMethod(
        Invocation.method(
          #initDb,
          [otherPath],
        ),
        returnValue: _i8.Future<_i5.Database>.value(_FakeDatabase_3(
          this,
          Invocation.method(
            #initDb,
            [otherPath],
          ),
        )),
      ) as _i8.Future<_i5.Database>);
  @override
  _i8.Future<int> insertMovieWatchlist(Map<String, dynamic>? data) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertMovieWatchlist,
          [data],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<int> insertTvWatchlist(Map<String, dynamic>? data) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertTvWatchlist,
          [data],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<int> removeMovieWatchlist(Map<String, dynamic>? data) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeMovieWatchlist,
          [data],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<int> removeTvWatchlist(Map<String, dynamic>? data) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeTvWatchlist,
          [data],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieById,
          [id],
        ),
        returnValue: _i8.Future<Map<String, dynamic>?>.value(),
      ) as _i8.Future<Map<String, dynamic>?>);
  @override
  _i8.Future<Map<String, dynamic>?> getTvById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvById,
          [id],
        ),
        returnValue: _i8.Future<Map<String, dynamic>?>.value(),
      ) as _i8.Future<Map<String, dynamic>?>);
  @override
  _i8.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i8.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i8.Future<List<Map<String, dynamic>>>);
  @override
  _i8.Future<List<Map<String, dynamic>>> getWatchlistTvs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvs,
          [],
        ),
        returnValue: _i8.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i8.Future<List<Map<String, dynamic>>>);
  @override
  _i8.Future<void> insertCacheTransactionMovie(
    List<Map<String, dynamic>>? movies,
    String? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertCacheTransactionMovie,
          [
            movies,
            category,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> insertCacheTransactionTv(
    List<Map<String, dynamic>>? movies,
    String? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertCacheTransactionTv,
          [
            movies,
            category,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<List<Map<String, dynamic>>> getCacheMovies(String? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCacheMovies,
          [category],
        ),
        returnValue: _i8.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i8.Future<List<Map<String, dynamic>>>);
  @override
  _i8.Future<List<Map<String, dynamic>>> getCacheTvs(String? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCacheTvs,
          [category],
        ),
        returnValue: _i8.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i8.Future<List<Map<String, dynamic>>>);
  @override
  _i8.Future<int> clearCacheMovie(String? category) => (super.noSuchMethod(
        Invocation.method(
          #clearCacheMovie,
          [category],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<int> clearCacheTv(String? category) => (super.noSuchMethod(
        Invocation.method(
          #clearCacheTv,
          [category],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i24.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i6.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i6.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i25.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i25.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i25.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i25.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i26.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i26.Uint8List>.value(_i26.Uint8List(0)),
      ) as _i8.Future<_i26.Uint8List>);
  @override
  _i8.Future<_i6.StreamedResponse> send(_i6.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i8.Future<_i6.StreamedResponse>.value(_FakeStreamedResponse_5(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i8.Future<_i6.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
