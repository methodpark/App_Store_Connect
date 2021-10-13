import 'dart:convert';

import 'package:app_store_connect_apis/src/models/build.dart';
import 'package:test/test.dart';

void main() {
  group('Profile model:', () {
    test('constructor - default values - creates profile', () {
      var id = '12345';
      var version = '9876';
      var uploadedDate = DateTime.now();
      var expirationDate = DateTime.now();
      var expired = false;
      var minOsVersion = '14.0';
      var processingState = 'VALID';
      var usesNonExemptEncryption = 'false';

      var build = Build(id, version, minOsVersion, processingState,
          usesNonExemptEncryption, uploadedDate, expirationDate, expired);

      expect(build.id, equals(id));
      expect(build.version, equals(version));
      expect(build.uploadedDate, equals(uploadedDate));
      expect(build.expirationDate, equals(expirationDate));
      expect(build.expired, equals(expired));
      expect(build.minOsVersion, equals(minOsVersion));
      expect(build.processingState, equals(processingState));
      expect(build.usesNonExemptEncryption, equals(usesNonExemptEncryption));
    });

    test('fromJson - default values - creates profile', () {
      var jsonString = '''{
    "id" : "123456",
    "attributes" : {
      "version" : "987654",
      "uploadedDate" : "2021-09-20",
      "expirationDate" : "2021-09-25",
      "expired" : true,
      "minOsVersion" : "13.0",
      "processingState" : "VALID",
      "usesNonExemptEncryption" : null
    }}''';

      var build =
          Build.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);

      expect(build.id, equals('123456'));
      expect(build.version, equals('987654'));
      expect(build.uploadedDate, equals(DateTime(2021, 09, 20)));
      expect(build.expirationDate, equals(DateTime(2021, 09, 25)));
      expect(build.expired, equals(true));
      expect(build.minOsVersion, equals('13.0'));
      expect(build.processingState, equals('VALID'));
      expect(build.usesNonExemptEncryption, equals('null'));
    });

    test('toString - default values - returns expected value', () {
      var id = '12345';
      var version = '9876';
      var uploadedDate = DateTime(2021, 09, 20);
      var expirationDate = DateTime(2021, 09, 25);
      var expired = false;
      var minOsVersion = '14.0';
      var processingState = 'VALID';
      var usesNonExemptEncryption = 'false';
      var build = Build(id, version, minOsVersion, processingState,
          usesNonExemptEncryption, uploadedDate, expirationDate, expired);

      var result = build.toString();

      var expectedValue =
          '\nID: 12345, version: 9876, minOsVersion: 14.0, usesNonExemptEncryption: false, processingState: VALID, uploadedDate: 2021-09-20 00:00:00.000, expirationDate: 2021-09-25 00:00:00.000, expired: false';
      expect(result, equals(expectedValue));
    });
  });
}
