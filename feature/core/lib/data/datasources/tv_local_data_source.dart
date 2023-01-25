import 'package:core/common/utils/exception.dart';

import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/data/models/tv_show_table.dart';

abstract class TvLocalDataSource {
  Future<String> insertWatchlist(TVShowTable tvShow);
  Future<String> removeWatchlist(TVShowTable tvShow);
  Future<TVShowTable?> getTvById(int id);
  Future<List<TVShowTable>> getWatchlistTvs();

  Future<void> cacheNowPlayingTvs(List<TVShowTable> tvShows);
  Future<List<TVShowTable>> getCachedNowPlayingTvs();
}

class TvLocalDataSourceImpl implements TvLocalDataSource {
  final DatabaseHelper databaseHelper;

  TvLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlist(TVShowTable tvShow) async {
    try {
      await databaseHelper.insertTvWatchlist(tvShow.toJson());
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(TVShowTable tvShow) async {
    try {
      await databaseHelper.removeTvWatchlist(tvShow.toJson());
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<TVShowTable?> getTvById(int id) async {
    final result = await databaseHelper.getTvById(id);
    if (result != null) {
      return TVShowTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TVShowTable>> getWatchlistTvs() async {
    final result = await databaseHelper.getWatchlistTvs();
    return result.map((data) => TVShowTable.fromMap(data)).toList();
  }

  @override
  Future<void> cacheNowPlayingTvs(List<TVShowTable> tvShows) async {
    await databaseHelper.clearCacheTv('now playing');
    await databaseHelper.insertCacheTransactionTv(tvShows.map((e) => e.toJson()).toList(), 'now playing');
  }

  @override
  Future<List<TVShowTable>> getCachedNowPlayingTvs() async {
    final result = await databaseHelper.getCacheTvs('now playing');
      if (result.length > 0) {
    return result.map((data) => TVShowTable.fromMap(data)).toList();
  } else {
    throw CacheException("Can't get the data :(");
  }
  }
}
