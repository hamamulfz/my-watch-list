import 'dart:async';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  DatabaseHelper.initDb(db) {
    this.db = db;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  Database? db;

  Future<Database?> get database async {
    if (db == null) {
      db = await initDb();
    }
    return db;
  }

  static const String tblWatchlistMovie = 'watchlist_movie';
  static const String tblWatchlistTv = 'watchlist_tv';
  static const String tblCacheTv = 'cache_tv';
  static const String tblCacheMovie = 'cache_movie';

  Future initialize(String path) async {
    db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<Database> initDb([otherPath]) async {
    final path = await getDatabasesPath();
    final databasePath = otherPath ?? '$path/ditonton.db';

    var db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  static const createTableWatchListTv = '''
      CREATE TABLE  $tblWatchlistTv (
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        posterPath TEXT,
        category TEXT
      );
    ''';
    
  static const createTableWatchListMovie = '''
      CREATE TABLE  $tblWatchlistMovie (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''';

  static const createTableCacheTv = '''
CREATE TABLE  $tblCacheTv (
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        posterPath TEXT,
        category TEXT
      );
    ''';
  static const createTableCacheMovie = '''
      CREATE TABLE  $tblCacheMovie (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT,
        category TEXT
      );
    ''';

  void _onCreate(Database db, int version) async {
    await db.execute(createTableWatchListMovie);
    await db.execute(createTableWatchListTv);

    await db.execute(createTableCacheMovie);
    await db.execute(createTableCacheTv);
  }

  Future<int> insertMovieWatchlist(Map<String, dynamic> data) async {
    final db = await database;
    return await db!.insert(tblWatchlistMovie, data);
  }

  Future<int> insertTvWatchlist(Map<String, dynamic> data) async {
    final db = await database;
    return await db!.insert(tblWatchlistTv, data);
  }

  Future<int> removeMovieWatchlist(Map<String, dynamic> data) async {
    final db = await database;
    return await db!.delete(
      tblWatchlistMovie,
      where: 'id = ?',
      whereArgs: [data['id']],
    );
  }

  Future<int> removeTvWatchlist(Map<String, dynamic> data) async {
    final db = await database;
    return await db!.delete(
      tblWatchlistTv,
      where: 'id = ?',
      whereArgs: [data['id']],
    );
  }

  Future<Map<String, dynamic>?> getMovieById(int id) async {
    final db = await database;
    final results = await db!.query(
      tblWatchlistMovie,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getTvById(int id) async {
    final db = await database;
    final results = await db!.query(
      tblWatchlistTv,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlistMovies() async {
    final db = await database;
    final List<Map<String, dynamic>> results =
        await db!.query(tblWatchlistMovie);

    return results;
  }

  Future<List<Map<String, dynamic>>> getWatchlistTvs() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(tblWatchlistTv);

    return results;
  }

  Future<void> insertCacheTransactionMovie(
      List<Map<String, dynamic>> movies, String category) async {
    final db = await database;
    db!.transaction((txn) async {
      for (final movie in movies) {
        final movieJson = movie;
        movieJson['category'] = category;
        txn.insert(tblCacheMovie, movieJson);
      }
    });
  }

  Future<void> insertCacheTransactionTv(
      List<Map<String, dynamic>> movies, String category) async {
    final db = await database;
    db!.transaction((txn) async {
      for (final movie in movies) {
        final movieJson = movie;
        movieJson['category'] = category;
        txn.insert(tblCacheTv, movieJson);
      }
    });
  }

  Future<List<Map<String, dynamic>>> getCacheMovies(String category) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(
      tblCacheMovie,
      where: 'category = ?',
      whereArgs: [category],
    );
    return results;
  }

  Future<List<Map<String, dynamic>>> getCacheTvs(String category) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(
      tblCacheTv,
      where: 'category = ?',
      whereArgs: [category],
    );
    return results;
  }

  Future<int> clearCacheMovie(String category) async {
    final db = await database;
    return await db!.delete(
      tblCacheMovie,
      where: 'category = ?',
      whereArgs: [category],
    );
  }

  Future<int> clearCacheTv(String category) async {
    final db = await database;
    return await db!.delete(
      tblCacheTv,
      where: 'category = ?',
      whereArgs: [category],
    );
  }
}
