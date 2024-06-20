class MapDetails {
  String? uuid;
  String? displayName;
  String? listViewIcon;
  String? displayIcon;
  String? splash;

  MapDetails({this.uuid,this.displayName, this.listViewIcon, this.displayIcon, this.splash});
  factory MapDetails.fromJson(Map<String, dynamic> json) {
    return MapDetails(
      uuid: json['uuid'],
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
      listViewIcon: json['listViewIcon'],
      splash: json['splash'],
    );
  }
}
