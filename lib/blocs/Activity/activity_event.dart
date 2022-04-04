part of 'activity_bloc.dart';

@immutable
abstract class ActivityEvent {}

class GetUserActivities extends ActivityEvent {}

class AddActivity extends ActivityEvent {
  final User user;
  final String activityName, foodAte;
  final int glassesOfWater, stepsWalked, activityPoints;

  AddActivity({
    required this.user,
    required this.activityName,
    required this.foodAte,
    required this.glassesOfWater,
    required this.stepsWalked,
    required this.activityPoints,
  });
}

class ResetActivityState extends ActivityEvent {}
