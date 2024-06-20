class agentsAbilities {
  String? displayName;
  String? description;
  String? displayIcon;

  agentsAbilities({this.displayName, this.description, this.displayIcon});

  factory agentsAbilities.fromJson(Map<String, dynamic> json) {
    return agentsAbilities(
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'],
    );
  }
}

class agentsListDetails {
  String? uuid;
  String? displayName;
  String? fullPortrait;
  String? description;
  List? abilities;

  agentsListDetails(
      {this.uuid,
      this.displayName,
      this.fullPortrait,
      this.description,
      this.abilities});
  factory agentsListDetails.fromJson(Map<String, dynamic> json) {
    return agentsListDetails(
      uuid: json['uuid'],
      description: json['description'],
      displayName: json['displayName'],
      fullPortrait: json['fullPortrait'],
      abilities: json['abilities'].map((e) => agentsAbilities.fromJson(e)).toList(),
    );
  }
}
