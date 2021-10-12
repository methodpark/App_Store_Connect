import 'dart:convert';

import 'package:app_store_connect_apis/src/models/profile.dart';
import 'package:test/test.dart';

void main() {
  group('Profile model:', () {
    test('constructor - default values - creates profile', () {
      var id = '123456';
      var content = 'Some content';
      var name = 'Profile name';
      var type = 'IOS_APP_ADHOC';
      var state = 'ACTIVE';

      var profile = Profile(id, content, name, type, state);

      expect(profile.id, equals(id));
      expect(profile.content, equals(content));
      expect(profile.name, equals(name));
      expect(profile.type, equals(type));
      expect(profile.state, equals(state));
    });

    test('fromJson - default values - creates profile', () {
      var jsonString = '''{
    "id" : "123456",
    "attributes" : {
      "profileState" : "ACTIVE",
      "profileContent" : "Some content",
      "profileType" : "IOS_APP_ADHOC",
      "name" : "Profile name"}}''';

      var profile =
          Profile.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);

      expect(profile.id, equals('123456'));
      expect(profile.content, equals('Some content'));
      expect(profile.name, equals('Profile name'));
      expect(profile.type, equals('IOS_APP_ADHOC'));
      expect(profile.state, equals('ACTIVE'));
    });

    test('toString - default values - returns expected value', () {
      var id = '123456';
      var content = 'Some content';
      var name = 'Profile name';
      var type = 'IOS_APP_ADHOC';
      var state = 'ACTIVE';
      var profile = Profile(id, content, name, type, state);

      var result = profile.toString();

      var expectedValue =
          '\nID: 123456, Name: Profile name, State: ACTIVE, Type: IOS_APP_ADHOC';
      expect(result, equals(expectedValue));
    });
  });
}
