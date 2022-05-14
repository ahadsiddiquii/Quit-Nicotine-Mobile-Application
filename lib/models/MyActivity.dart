import 'package:nicotine/models/User.dart';

class UserActivity {
  String? activityId;
  User? user;
  String? activityName;
  int? glassesOfWater;
  String? foodAte;
  int? stepsWalked;
  int? cigarettesSmoked;
  int? herbalMix;
  DateTime? activityCreationDate;
  int? activityPoints;

  UserActivity({
    required this.activityId,
    required this.user,
    required this.activityName,
    required this.glassesOfWater,
    required this.foodAte,
    required this.stepsWalked,
    required this.cigarettesSmoked,
    required this.herbalMix,
    required this.activityCreationDate,
    required this.activityPoints,
  });

  UserActivity.fromJson(Map<String, dynamic> json) {
    this.activityId = json['activityId'] ?? '';
    this.user = User.fromJson(json['user']);

    this.activityName = json['activityName'] ?? '';
    this.glassesOfWater =
        json['glassesOfWater'] != null ? (json['glassesOfWater']).toInt() : 0;
    this.foodAte = json['foodAte'] ?? '';
    this.stepsWalked =
        json['stepsWalked'] != null ? (json['stepsWalked']).toInt() : 0;
    this.cigarettesSmoked = json['cigarettesSmoked'] != null
        ? (json['cigarettesSmoked']).toInt()
        : 0;
    this.herbalMix =
        json['herbalMix'] != null ? (json['herbalMix']).toInt() : 0;

    this.activityCreationDate = json['activityCreationDate'] != null
        ? DateTime.parse(json['activityCreationDate'])
        : DateTime.now();
    this.activityPoints = json['activityCreationDate'] == null
        ? (json['activityCreationDate']).toInt()
        : 0;

    // this.email = json['email'] ?? '';
    // this.first_name = json['first_name'] ?? '';
    // this.last_name = json['last_name'] ?? '';
  }
}
