import 'package:ditonton/common/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helper.mocks.dart';

void main() {
  late NetworkInfoImpl info;
  late MockDataConnectionChecker mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockDataConnectionChecker();
    info = NetworkInfoImpl(mockNetworkInfo);
  });

  group("NetworkInfo Result", () {
    test("if have connection, then return true", () async {
      when(mockNetworkInfo.hasConnection)
          .thenAnswer((realInvocation) async => true);
      final connection = await info.isConnected;
      expect(connection, true);
    });
    
    test("if there is no connection, then return false", () async {
      when(mockNetworkInfo.hasConnection)
          .thenAnswer((realInvocation) async => false);
      final connection = await info.isConnected;
      expect(connection, false);
    });
  });
}
