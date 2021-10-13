class Build {
  final String id;
  final String version;
  final DateTime uploadedDate;
  final DateTime expirationDate;
  final bool expired;
  final String minOsVersion;
  final String processingState;
  final String usesNonExemptEncryption;

  /// [id] The ID of the build
  ///
  /// [version] The version of the build
  ///
  /// [minOsVersion] The minimum iOS Version of the build
  ///
  /// [processingState] The processing state of the build
  ///
  /// [usesNonExemptEncryption] If the build uses non exempt encryption
  ///
  /// [uploadedDate] The upload date of the build
  ///
  /// [expirationDate] The expiration date of the build
  ///
  /// [expired] If the build is expired or not
  Build(
      this.id,
      this.version,
      this.minOsVersion,
      this.processingState,
      this.usesNonExemptEncryption,
      this.uploadedDate,
      this.expirationDate,
      this.expired);

  Build.fromJson(
    Map<String, dynamic> json,
  )   : id = json['id'].toString(),
        version = json['attributes']['version'].toString(),
        minOsVersion = json['attributes']['minOsVersion'].toString(),
        processingState = json['attributes']['processingState'].toString(),
        usesNonExemptEncryption =
            json['attributes']['usesNonExemptEncryption'].toString(),
        uploadedDate =
            DateTime.parse(json['attributes']['uploadedDate'].toString()),
        expirationDate =
            DateTime.parse(json['attributes']['expirationDate'].toString()),
        expired = json['attributes']['expired'] as bool;

  @override
  String toString() {
    var string = '\nID: ' +
        id +
        ', version: ' +
        version +
        ', minOsVersion: ' +
        minOsVersion +
        ', usesNonExemptEncryption: ' +
        usesNonExemptEncryption +
        ', processingState: ' +
        processingState +
        ', uploadedDate: ' +
        uploadedDate.toString() +
        ', expirationDate: ' +
        expirationDate.toString() +
        ', expired: ' +
        expired.toString();

    return string;
  }
}
