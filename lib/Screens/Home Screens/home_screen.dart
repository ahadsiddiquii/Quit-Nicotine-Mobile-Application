import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:nicotine/Constant.dart';
import 'package:nicotine/Screens/Components/progressFunction.dart';
import 'package:nicotine/Screens/Home%20Screens/goals_screen.dart';
import 'package:nicotine/Screens/my_goals_screen.dart';
import 'package:nicotine/models/UserGoal.dart';
import 'package:sizer/sizer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../blocs/Goal/goal_bloc.dart';
import '../../utils/goalHelper.dart';
import 'components/status_card.dart';
import 'components/timer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int runningGoals = 0;
  int inProcessGoals = 0;
  int cancelGoals = 0;
  int completeGoals = 0;
  DateTime latestGoalDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalBloc, GoalState>(
      builder: (context, state) {
        if (state is UserGoalsRetrieved) {
          if (state.goals.isNotEmpty) {
            UserGoal latestGoal = state.goals[0];
            latestGoalDateTime =
                latestGoal.goalDate!.add(Duration(days: latestGoal.goalDays!));
          }
          state.goals.forEach((element) {
            if (isGoalInProcess(element, DateTime.now())) {
              inProcessGoals += 1;
            } else if (isGoalCompleted(element, DateTime.now())) {
              completeGoals += 1;
            } else if (isGoalRunning(element, DateTime.now())) {
              runningGoals += 1;
            }
            print(runningGoals);
            print(inProcessGoals);
          });
          return Container(
            height: 100.h,
            width: 100.w,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 14.h,
                  width: 95.w,
                  decoration: BoxDecoration(
                      // color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.yellow,
                          Colors.green,
                        ],
                      )),
                  child: Center(
                    child: CountdownTimer(
                        endWidget: Center(
                          child: Text("Set a Goal",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25.sp)),
                        ),
                        endTime: latestGoalDateTime.millisecondsSinceEpoch,
                        onEnd: () {},
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 25.sp)),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Timer(
                  //       time: latestGoalDateTime
                  //           .difference(DateTime.now())
                  //           .inDays,
                  //       title: "DAYS",
                  //     ),
                  //     Text(":",
                  //         style: TextStyle(
                  //             color: Colors.black38,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 28.sp)),
                  // Timer(
                  //   time: 12,
                  //   title: "HOURS",
                  // ),
                  //     Text(":",
                  //         style: TextStyle(
                  //             color: Colors.black38,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 28.sp)),
                  //     Timer(
                  //       time: 18,
                  //       title: "MINUTES",
                  //     ),
                  //     Text(":",
                  //         style: TextStyle(
                  //             color: Colors.black38,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 28.sp)),
                  //     Timer(
                  //       time: 22,
                  //       title: "SECONDS",
                  //     ),
                  //   ],
                  // ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: 95.w,
                  child: Text(
                    "My Goals",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  // height: 30.h,
                  // color: Colors.cyanAccent,
                  width: 95.w,
                  child: Table(
                    border: TableBorder.all(color: Colors.white),
                    children: [
                      TableRow(children: [
                        StatusCard(
                          status: "Running",
                          goal: runningGoals.toString(),
                        ),
                        StatusCard(
                          status: "In process",
                          goal: inProcessGoals.toString(),
                        ),
                      ]),
                      TableRow(children: [
                        StatusCard(
                          status: "Complete",
                          goal: completeGoals.toString(),
                        ),
                        StatusCard(
                          status: "Cancel",
                          goal: cancelGoals.toString(),
                        ),
                      ])
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: 95.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: 50.w,
                        child: Text(
                          "Latest Goals",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GoalsScreen(
                                        show_appbar: true,
                                      )));
                        },
                        child: Container(
                          // width: 30.w,
                          child: Text(
                            "See More",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                if (state.goals.isNotEmpty) progressFunction(state.goals[0]),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => MyGoalsScreen()));
                //   },
                //   child: Container(
                //       height: 18.h,
                //       width: 95.w,
                //       decoration: BoxDecoration(
                //         // color: Colors.yellow,
                //         borderRadius: BorderRadius.circular(20),
                //         color: kSigninColor,
                //       ),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         children: [
                //           Container(
                //               margin: EdgeInsets.symmetric(horizontal: 6.w),
                //               child: Text(
                //                 "Quit Nicotine",
                //                 style: TextStyle(
                //                     color: Colors.white,
                //                     fontWeight: FontWeight.w400,
                //                     fontSize: 18.sp),
                //               )),
                //           SizedBox(
                //             height: 1.h,
                //           ),
                //           Container(
                //             margin: EdgeInsets.symmetric(horizontal: 6.w),
                //             child: Text(
                //               "Progress",
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.w400,
                //                   fontSize: 11.sp),
                //             ),
                //           ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Padding(
                //                 padding: EdgeInsets.only(left: 4.w),
                //                 child: LinearPercentIndicator(
                //                   width: 75.w,
                //                   // width: MediaQuery.of(context).size.width - 50,
                //                   animation: true,
                //                   lineHeight: 1.6.h,
                //                   animationDuration: 2000,
                //                   percent: 0.45,
                //                   center: Text(
                //                     "45%",
                //                     style: TextStyle(
                //                         color: Colors.white,
                //                         fontSize: 9.sp,
                //                         fontWeight: FontWeight.w500,
                //                         height: 1),
                //                   ),
                //                   // linearStrokeCap: LinearStrokeCap.roundAll,
                //                   barRadius: Radius.circular(20),
                //                   // curve: Curves.linear,
                //                   progressColor: kSignupColor,
                //                 ),
                //               ),
                //               Icon(
                //                 Icons.arrow_forward_ios_rounded,
                //                 color: Colors.white,
                //               ),
                //               SizedBox(
                //                 width: 1.sp,
                //               )
                //             ],
                //           ),
                //           SizedBox(
                //             height: 2.h,
                //           ),
                //           Container(
                //             margin: EdgeInsets.symmetric(horizontal: 6.w),
                //             // width: 60.w,
                //             child: Row(
                //               children: [
                //                 Icon(
                //                   Icons.calendar_today_rounded,
                //                   color: kSignupColor,
                //                 ),
                //                 Text(
                //                   "  120 Days",
                //                   style: TextStyle(
                //                       color: Colors.white,
                //                       fontWeight: FontWeight.w400,
                //                       fontSize: 11.sp),
                //                 ),
                //                 Spacer(),
                //                 Icon(
                //                   Icons.access_time,
                //                   color: kSignupColor,
                //                 ),
                //                 Text(
                //                   "  20 min time Slots",
                //                   style: TextStyle(
                //                       color: Colors.white,
                //                       fontWeight: FontWeight.w400,
                //                       fontSize: 11.sp),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           SizedBox(
                //             height: 1.h,
                //           ),
                //         ],
                //       )),
                // ),
                SizedBox(
                  height: 1.h,
                ),
              ]),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
