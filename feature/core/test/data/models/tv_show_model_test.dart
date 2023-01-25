import 'package:core/data/models/tv_show_model.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tTvModel = TVShowModel(
    originCountry: [""],
    originalLanguage: "",
    // adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalName: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'releaseDate',
    name: 'title',
    // video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  const tTv = TvShow(
    originCountry: [""],
    originalLanguage: "",
    // adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalName: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'releaseDate',
    name: 'title',
    // video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  test('should be a subclass of TvShow entity', () async {
    final result = tTvModel.toEntity();
    expect(result, tTv);
  });
}
