import 'package:flutter_test/flutter_test.dart';
import 'package:ssl_pinning/ssl_helper.dart';

import 'package:ssl_pinning/ssl_pinning.dart';

void main() {
  group('SSL Pinning tests', () {
    test('should get response 200 when connection succeeded', () async {
      final _myClient = await SslHelper.createEnvironmentClient();
      final response = await _myClient.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=2174d146bb9c0eab47529b2e77d6b526'));

      expect(response.statusCode, 200);
      _myClient.close();
    });

    test('should get response other than 200', () async {
      final _myClient = await SslHelper.createEnvironmentClient();
      bool isSuccess = false;
      try {
        final response = await _myClient
            .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
        isSuccess = true;
      } catch (_) {}

      expect(isSuccess, false);
      _myClient.close();
    });
  });
}
