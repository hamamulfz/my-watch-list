library ssl_pinning;

import 'package:http/http.dart' as http;
import 'package:ssl_pinning/ssl_helper.dart';

class NetworkSslPinning {
  static Future<http.Client> get _instance async =>
      _clientInstance ??= await SslHelper.createEnvironmentClient();

  static http.Client? _clientInstance;
  static http.Client get client => _clientInstance ?? http.Client();

  static Future<void> init() async {
    _clientInstance = await _instance;
  }
}
