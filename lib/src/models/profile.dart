class Profile {
  final String id;
  final String content;
  final String name;
  final String type;
  final String state;

  /// [id] The ID of the provisioning profile
  ///
  /// [content] The raw content which can be used to store the provisioning profile as a file
  ///
  /// [name] The name of the provisioning profile
  ///
  /// [type] The type of the provisioning profile, such as adhoc or store.
  ///
  /// [state] The state of the provisioning profile (e.g. active or inactive)
  Profile(this.id, this.content, this.name, this.type, this.state);

  Profile.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        content = json['attributes']['profileContent'].toString(),
        name = json['attributes']['name'].toString(),
        type = json['attributes']['profileType'].toString(),
        state = json['attributes']['profileState'].toString();

  @override
  String toString() {
    var string = '\nID: ' +
        id +
        ', Name: ' +
        name +
        ', State: ' +
        state +
        ', Type: ' +
        type;

    return string;
  }
}
