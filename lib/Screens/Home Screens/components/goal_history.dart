import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../../Constant.dart';
import '../../../blocs/Goal/goal_bloc.dart';
import '../../../utils/date_util.dart';
import '../../../utils/goalHelper.dart';
import '../../Components/progressFunction.dart';
import '../../my_goals_screen.dart';

class GoalsHistory extends StatelessWidget {
  final int tabKey;
  GoalsHistory({required this.tabKey});
  // const GoalsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalBloc, GoalState>(builder: (context, state) {
      if (state is UserGoalsRetrieved) {
        return Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: state.goals.map((p) {
                if (tabKey == 1) {
                  return progressFunction(p);
                } else if (tabKey == 2) {
                  bool isValidGoal = isGoalRunning(p, DateTime.now());
                  if (isValidGoal) {
                    print(p.goalName!);
                    print(formatterMonDateYear.format(p.goalDate!));
                    return progressFunction(p);
                  } else {
                    return Container();
                  }
                } else {
                  bool isCompletedGoal = isGoalCompleted(p, DateTime.now());
                  if (isCompletedGoal) {
                    print(p.goalName!);
                    print(formatterMonDateYear.format(p.goalDate!));
                    return progressFunction(p);
                  } else {
                    return Container();
                  }
                }
              }).toList(),
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
