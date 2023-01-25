import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:core/common/utils/network_info.dart';
import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/data/datasources/movie_local_data_source.dart';
import 'package:core/data/datasources/movie_remote_data_source.dart';
import 'package:core/data/datasources/tv_local_data_source.dart';
import 'package:core/data/datasources/tv_remote_data_source.dart';
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  TvShowRepository,
  TvRemoteDataSource,
  TvLocalDataSource,
  DatabaseHelper,
  NetworkInfo,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
  MockSpec<Database>(as: #MockDatabase),
  MockSpec<Sqflite>(as: #MockSqflite),
  MockSpec<DataConnectionChecker>(as: #MockDataConnectionChecker),
  
])
void main() {}