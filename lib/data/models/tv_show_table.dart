import 'package:ditonton/data/models/tv_show_model.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:equatable/equatable.dart';

class TVShowTable extends Equatable {
  TVShowTable({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.overview,
  });

  final int id;
  final String? name;
  final String? posterPath;
  final String? overview;

  factory TVShowTable.fromEntity(TVShowDetail tvShow) => TVShowTable(
        id: tvShow.id,
        name: tvShow.name,
        posterPath: tvShow.posterPath,
        overview: tvShow.overview,
      );

  factory TVShowTable.fromMap(Map<String, dynamic> map) => TVShowTable(
        id: map["id"],
        name: map["name"],
        posterPath: map["posterPath"],
        overview: map["overview"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'posterPath': posterPath,
        'overview': overview,
        // 'type': 1,
      };

  TvShow toEntity() => TvShow.watchlist(
        id: this.id,
        overview: this.overview,
        posterPath: this.posterPath,
        name: this.name,
      );

  factory TVShowTable.fromDTO(TVShowModel movie) => TVShowTable(
        id: movie.id,
        name: movie.name,
        posterPath: movie.posterPath,
        overview: movie.overview,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        posterPath,
        overview,
      ];
}
