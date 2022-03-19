class MyActivity {
  late String activityId;
  late String userId;
  late String activityName;
  late int glassesOfWater;
  late String foodEat;
  late int stepsWalked;
  late DateTime creationDate;
  late int points;

  MyActivity({
    required this.activityId,
    required this.userId,
    required this.activityName,
    required this.glassesOfWater,
    required this.foodEat,
    required this.stepsWalked,
    required this.creationDate,
    required this.points,
  });

  MyActivity.fromJson(Map<String, dynamic> json) {
    this.activityId = json['activityId'] ?? '';
    this.userId = json['userId'] ?? '';
    this.activityName = json['activityName'] ?? '';
    this.glassesOfWater =
        json['glassesOfWater'] == null ? (json['glassesOfWater']).toInt() : 0;
    this.foodEat = json['foodEat'] ?? '';
    this.stepsWalked =
        json['stepsWalked'] == null ? (json['stepsWalked']).toInt() : 0;

    this.creationDate = json['creationDate'] != null
        ? DateTime.parse(json['creationDate'])
        : DateTime.now();
    this.points = json['points'] == null ? (json['points']).toInt() : 0;

    // this.email = json['email'] ?? '';
    // this.first_name = json['first_name'] ?? '';
    // this.last_name = json['last_name'] ?? '';
  }
}
