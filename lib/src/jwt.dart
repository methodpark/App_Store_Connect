import 'package:jose/jose.dart';

String createJWT(String issuer, String keyFile, String keyId) {
  Map<String, dynamic> payload = <String, dynamic>{
    'iss': issuer,
    'exp': createExpirationTimeAsUnixEpochTime(DateTime.now()),
    'aud': 'appstoreconnect-v1'
  };

  var claims = JsonWebTokenClaims.fromJson(payload);

  var builder = JsonWebSignatureBuilder();
  builder.jsonContent = claims.toJson();
  builder.addRecipient(
    JsonWebKey.fromPem(keyFile, keyId: keyId),
    algorithm: 'ES256',
  );

  var jws = builder.build();
  var jwt = jws.toCompactSerialization();

  return jwt;
}

int createExpirationTimeAsUnixEpochTime(DateTime currentTime) {
  var maximumTokenLifeTime = const Duration(minutes: 15);

  var expirationTime = currentTime.add(maximumTokenLifeTime);

  var unixEpochTime = expirationTime.millisecondsSinceEpoch ~/ 1000;

  return unixEpochTime;
}
