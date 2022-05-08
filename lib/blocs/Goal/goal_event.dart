part of 'goal_bloc.dart';

@immutable
abstract class GoalEvent {}

class GetUserGoals extends GoalEvent {}

class AddGoal extends GoalEvent {
  final User user;
  final String goalName;
  // final String goalDescription;
  // final String goalStatus;
  final int goalDays;
  final DateTime goalDate;
  // final int goalTimeSlot;

  AddGoal({
    required this.user,
    required this.goalName,
    // required this.goalDescription,
    // required this.goalStatus,
    required this.goalDays,
    required this.goalDate,
    // required this.goalTimeSlot,
  });
}

class DeleteAGoal extends GoalEvent {
  final String goalId;

  DeleteAGoal({
    required this.goalId,
  });
}

class ResetGoalState extends GoalEvent {}
