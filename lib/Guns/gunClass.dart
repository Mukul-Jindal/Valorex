// import 'dart:convert';

class damageranges {
  double? rangeStartMeters;
  double? rangeEndMeters;
  double? headDamage;
  double? bodyDamage;
  double? legDamage;

  damageranges({
    this.rangeStartMeters,
    this.rangeEndMeters,
    this.headDamage,
    this.bodyDamage,
    this.legDamage,
  });

  factory damageranges.fromJson(Map<String, dynamic> json) {
    return damageranges(
      rangeStartMeters: json['rangeStartMeters']?.toDouble(),
      rangeEndMeters: json['rangeEndMeters']?.toDouble(),
      headDamage: json['headDamage']?.toDouble(),
      bodyDamage: json['bodyDamage']?.toDouble(),
      legDamage: json['legDamage']?.toDouble(),
    );
  }
}

class adsstats {
  double firstBulletAccuracy;

  adsstats({
    required this.firstBulletAccuracy,
  });

  factory adsstats.fromJson(Map<String, dynamic> json) {
    return adsstats(
      firstBulletAccuracy: json['firstBulletAccuracy']?.toDouble(),
    );
  }
}

class weaponstats {
  double? fireRate;
  int? magazineSize;
  double? reloadTimeSeconds;
  double? equipTimeSeconds;
  String? wallPenetration;
  String? fireMode;
  double? runSpeedMultiplier;
  double? firstBulletAccuracy;
  adsstats? adsStats;
  List<damageranges>? damageRanges;

  weaponstats({
    this.fireRate,
    this.magazineSize,
    this.reloadTimeSeconds,
    this.equipTimeSeconds,
    this.wallPenetration,
    this.fireMode,
    this.runSpeedMultiplier,
    this.firstBulletAccuracy,
    this.adsStats,
    this.damageRanges,
  });

  factory weaponstats.fromJson(Map<String, dynamic> json) {
    return weaponstats(
        fireRate: json['fireRate']?.toDouble(),
        magazineSize: json['magazineSize'],
        reloadTimeSeconds: json['reloadTimeSeconds']?.toDouble(),
        equipTimeSeconds: json['equipTimeSeconds']?.toDouble(),
        wallPenetration: json['wallPenetration'].toString(),
        fireMode: json['fireMode'].toString(),
        runSpeedMultiplier: json['runSpeedMultiplier']?.toDouble(),
        firstBulletAccuracy: json['firstBulletAccuracy']?.toDouble(),
        adsStats: json['adsStats'] == null
            ? null
            : adsstats.fromJson(json['adsStats']),
        damageRanges: List<damageranges>.from(
            json['damageRanges'].map((x) => damageranges.fromJson(x))));
  }
}

class gunProfile {
  String uuid;
  String displayName;
  String category;
  String displayIcon;
  weaponstats? weaponStats;

  gunProfile({
    required this.uuid,
    required this.displayName,
    required this.category,
    required this.displayIcon,
    this.weaponStats,
  });

  factory gunProfile.fromJson(Map<String, dynamic> json) {
    return gunProfile(
      uuid: json['uuid'],
      displayName: json['displayName'],
      category: json['category'],
      displayIcon: json['displayIcon'],
      weaponStats: json['weaponStats'] == null
          ? null
          : weaponstats.fromJson(json['weaponStats']),
    );
  }
}
