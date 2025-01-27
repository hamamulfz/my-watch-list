import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/season.dart';
import 'package:equatable/equatable.dart';

class TVShowDetail extends Equatable {
  const TVShowDetail({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genres,
    required this.id,
    required this.name,
    // required this.originalName,
    required this.overview,
    required this.episodeRunTime,
    required this.posterPath,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.seasons,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;
  final String firstAirDate;
  final List<Genre> genres;
  final List<int> episodeRunTime;
  final int id;
  final String name;
  // final String originalName;
  final String overview;
  final String posterPath;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<Season> seasons;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        backdropPath,
        firstAirDate,
        genres,
        id,
        name,
        // originalName,
        overview,
        posterPath,
        episodeRunTime,
        numberOfEpisodes,
        numberOfSeasons,
        seasons,
        voteAverage,
        voteCount
      ];
}
