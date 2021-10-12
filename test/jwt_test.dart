import 'package:app_store_connect_apis/src/jwt.dart';
import 'package:test/test.dart';

void main() {
  group('JWT:', () {
    test(
        'createExpirationTimeAsUnixEpochTime - default call - returns expiration time as unix epoch time',
        () {
      var dateTime = DateTime.parse('2021-08-20 15:00:00Z');

      var result = createExpirationTimeAsUnixEpochTime(dateTime);

      expect(result, equals(1629472500));
    });
  });
}
