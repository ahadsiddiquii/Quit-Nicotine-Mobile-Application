import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nicotine/Constant.dart';
import 'package:nicotine/Screens/Components/backButton.dart';
import 'package:nicotine/models/MyActivity.dart';
import 'package:nicotine/utils/date_util.dart';
import 'package:sizer/sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../blocs/Activity/activity_bloc.dart';
import '../utils/goalHelper.dart';
import '30_days_progress.dart';
import 'today_activity.dart';

class MyActivity extends StatefulWidget {
  const MyActivity({Key? key}) : super(key: key);

  @override
  _MyActivityState createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> {
  @override
  void initState() {
    super.initState();
    getActivities();
  }

  getActivities() {
    BlocProvider.of<ActivityBloc>(context).add(GetUserActivities());
  }

  @override
  Widget build(BuildContext context) {
    Widget oneTimelineTile(UserActivity thisActivity, int currentIndex,
        DateTime activityFirstDate) {
      return TimelineTile(
        indicatorStyle: IndicatorStyle(
          color: kSigninColor,
          iconStyle: IconStyle(
              color: Colors.white, iconData: Icons.circle, fontSize: 11.sp),
        ),
        afterLineStyle: LineStyle(color: kSigninColor),
        beforeLineStyle: LineStyle(color: kSigninColor),
        alignment: TimelineAlign.manual,
        lineXY: 0.25,
        hasIndicator: true,
        endChild: Padding(
          padding: EdgeInsets.all(6.sp),
          child: GestureDetector(
            onTap: () {
              // showDialog<String>(
              //   context: context,
              //   builder: (BuildContext context) => AlertDialog(
              //       // alignment: Alignment.bottomCenter,
              //       backgroundColor: Colors.white,
              //       //  kLightColor,
              //       titlePadding: EdgeInsets.all(0),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(20))),
              //       title: GestureDetector(
              //         onTap: () => Navigator.pushReplacement(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => MyActivity())),
              //         child: Container(
              //           height: 22.h,
              //           width: 40.w,
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               // kLightColor,
              //               borderRadius: BorderRadius.circular(10),
              //               border:
              //                   Border.all(color: kSignupColor, width: 1.sp)),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Container(
              //                 height: 8.h,
              //                 width: 16.w,
              //                 child: Image.asset(
              //                   "assets/Haircut.png",
              //                   fit: BoxFit.fill,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 1.h,
              //               ),
              //               Text(
              //                 "Perform hairtest and send\nreport at",
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                     color: Colors.black,
              //                     // Color(0xffF8DB08),
              //                     fontSize: 11.sp,
              //                     fontWeight: FontWeight.w500,
              //                     height: 1.3),
              //               ),
              //               Text(
              //                 "info@quitnicotine4life.com",
              //                 style: TextStyle(
              //                     color: kSigninColor,
              //                     fontSize: 11.sp,
              //                     decoration: TextDecoration.underline,
              //                     fontWeight: FontWeight.w400,
              //                     height: 2),
              //               ),
              //             ],
              //           ),
              //         ),
              //       )),
              // );
              // _animationController.reset();
              // _animationController.forward();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  // kLightColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1.sp, color: kSignupColor)),
              constraints: BoxConstraints(
                minHeight: 20.h,
              ),
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            thisActivity.activityName!,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp),
                          ),
                          Icon(
                            Icons.more_vert_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Text(
                      "Complete  10 Points",
                      style: TextStyle(
                          color: kSigninColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 10.sp,
                          height: 1.3),
                    ),
                    // SizedBox(height: 5.sp,),
                    Text(
                      "Complete Task",
                      style: TextStyle(
                          color: kSignupColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          height: 2),
                    ),
                    Text(
                      "I drank ${thisActivity.glassesOfWater!.toString()} glasses of water",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 10.sp,
                          height: 1.3),
                    ),
                    Text(
                      // "I eat mineral food. (Orange, Apple)",
                      "I ate ${thisActivity.foodAte!}. ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 10.sp,
                          height: 1.3),
                    ),
                    Text(
                      "I walked ${thisActivity.stepsWalked!.toString()} steps.",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 10.sp,
                          height: 1.3),
                    ),
                    Text(
                      "Number of cigarettes I have smoked today is ${thisActivity.cigarettesSmoked?.toString() ?? 0}.",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 10.sp,
                          height: 1.3),
                    ),
                    Text(
                      "${thisActivity.herbalMix?.toString() ?? 0} grams of Herbal Smoking Mix I have added to my tobacco.",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 10.sp,
                          height: 1.3),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10.sp,
                      ),
                      // width: 60.w,
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: kSigninColor,
                            size: 14.sp,
                          ),
                          Text(
                            " ${dateWithTimeFormatter.format(thisActivity.activityCreationDate!)}",
                            // "  25 March, 2022",
                            style: TextStyle(
                                color: kSigninColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 10.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        startChild: Container(
          // color: Colors.amberAccent,
          child: Center(
              child: Text(
            "Day ${numberDay(thisActivity.activityCreationDate!, activityFirstDate)}",
            // "Day ${DateTime.now().difference(thisActivity.activityCreationDate!).inDays + 1}",
            style: TextStyle(
                color: kSigninColor,
                fontWeight: FontWeight.w600,
                fontSize: 11.sp,
                height: 2),
          )),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: backButton(context),
        //  Padding(
        //   padding: EdgeInsets.only(left: 5.sp),
        //   child: Container(
        //     margin: EdgeInsets.only(
        //         top: 1.4.h, bottom: 1.4.h, left: 2.w, right: 2.w),
        //     decoration: BoxDecoration(
        //       color: Colors.white.withOpacity(0.1),
        //       borderRadius: BorderRadius.circular(50),
        //     ),
        //     child: Builder(
        //       builder: (context) => IconButton(
        //         onPressed: () => Navigator.pop(context),
        //         icon: Icon(
        //           Icons.arrow_back_ios_rounded,
        //           size: 12.sp,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        backgroundColor: Colors.white,
        title: Text(
          "My Activity",
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DaysProgress(),
                  )),
              child: Container(
                // margin: EdgeInsets.only(right: 3.w),
                height: 5.h,
                width: 11.w,
                decoration: BoxDecoration(
                    color: Color(0xffF8DB08),
                    borderRadius: BorderRadius.circular(100)),
                child: Image.asset(
                  "assets/circular_arrow.png",
                ),
              ),
            ),
          ),
          //   Icon(
          //     Icons.more_horiz,
          //     size: 24.sp,
          //   ),
          SizedBox(
            width: 5.sp,
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 7.h,
        width: 65.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: kSignupColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodayActivity(),
              ),
            );
          },
          child: Text(
            "Upload Today's Activity",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15.sp),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 2.h,
            ),
            // ListTile(
            // title: Text(
            //   "Quit the Nicotine",
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.w600,
            //       fontSize: 17.sp),
            // ),
            // subtitle: Container(
            //   margin: EdgeInsets.only(top: 1.h, right: 10.w),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "120 Day",
            //         style: TextStyle(
            //             color: Color(0xffF8DB08),
            //             fontWeight: FontWeight.w400,
            //             fontSize: 12.sp),
            //       ),
            //       Text(
            //         "10 min",
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.w400,
            //             fontSize: 12.sp),
            //       ),
            //       Text(
            //         "150 Points",
            //         style: TextStyle(
            //             color: kSignupColor,
            //             fontWeight: FontWeight.w400,
            //             fontSize: 12.sp),
            //       ),
            //     ],
            //   ),
            // ),
            //   trailing: GestureDetector(
            //     onTap: () => Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => DaysProgress(),
            //         )),
            //     child: Container(
            //       // margin: EdgeInsets.only(right: 3.w),
            //       height: 5.h,
            //       width: 11.w,
            //       decoration: BoxDecoration(
            //           color: Color(0xffF8DB08),
            //           borderRadius: BorderRadius.circular(100)),
            //       child: Image.asset(
            //         "assets/circular_arrow.png",
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 2.h,
            ),

            //loop
            BlocBuilder<ActivityBloc, ActivityState>(
              builder: (context, state) {
                if (state is UserActivitiesRetrieved) {
                  DateTime dateTimeFirstActivity =
                      state.activities[0].activityCreationDate!;
                  return Container(
                    height: 80.h,
                    padding: EdgeInsets.only(bottom: 60),
                    child: SingleChildScrollView(
                      child: Column(
                        children: state.activities.map((p) {
                          int count = 0;
                          int currentCount = 0;
                          state.activities.forEach((element) {
                            count++;
                            if (element.activityId == p.activityId) {
                              currentCount = count;
                            }
                          });

                          return oneTimelineTile(
                              p, currentCount, dateTimeFirstActivity);
                        }).toList(),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 50.h,
                    child: Center(
                      child: Text(
                        "No activity has been added",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            // TimelineTile(
            //   indicatorStyle: IndicatorStyle(
            //     color: kSigninColor,
            //     iconStyle: IconStyle(
            //         color: Colors.black,
            //         iconData: Icons.circle,
            //         fontSize: 11.sp),
            //   ),
            //   afterLineStyle: LineStyle(color: kSigninColor),
            //   beforeLineStyle: LineStyle(color: kSigninColor),
            //   alignment: TimelineAlign.manual,
            //   lineXY: 0.25,
            //   hasIndicator: true,
            //   endChild: Padding(
            //     padding: EdgeInsets.all(6.sp),
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: kLightColor,
            //           borderRadius: BorderRadius.circular(15),
            //           border: Border.all(width: 1.sp, color: kSignupColor)),
            //       constraints: BoxConstraints(
            //         minHeight: 20.h,
            //       ),
            //       child: Padding(
            //         padding: EdgeInsets.all(10.sp),
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Container(
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Text(
            //                     "Quit Nicotine",
            //                     style: TextStyle(
            //                         color: Colors.white,
            //                         fontWeight: FontWeight.w600,
            //                         fontSize: 13.sp),
            //                   ),
            //                   Icon(
            //                     Icons.more_vert_rounded,
            //                     color: Colors.white,
            //                   )
            //                 ],
            //               ),
            //             ),
            //             Text(
            //               "In Process",
            //               style: TextStyle(
            //                   color: kSigninColor,
            //                   fontWeight: FontWeight.w300,
            //                   fontSize: 10.sp,
            //                   height: 1.3),
            //             ),
            //             // SizedBox(height: 5.sp,),
            //             Text(
            //               "Tasks",
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.w500,
            //                   fontSize: 10.sp,
            //                   height: 2),
            //             ),
            //             Text(
            //               "Drink 10 glass water",
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.w300,
            //                   fontSize: 10.sp,
            //                   height: 1.3),
            //             ),
            //             Text(
            //               "Use mineral food. (Orange, Apple)",
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.w300,
            //                   fontSize: 10.sp,
            //                   height: 1.3),
            //             ),
            //             Text(
            //               "Walk 10K step today",
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.w300,
            //                   fontSize: 10.sp,
            //                   height: 1.3),
            //             ),
            //             Container(
            //               margin: EdgeInsets.only(
            //                 top: 10.sp,
            //               ),
            //               // width: 60.w,
            //               child: Row(
            //                 children: [
            //                   Icon(
            //                     Icons.access_time,
            //                     color: kSigninColor,
            //                     size: 14.sp,
            //                   ),
            //                   Text(
            //                     "  25 June, 2021",
            //                     style: TextStyle(
            //                         color: kSigninColor,
            //                         fontWeight: FontWeight.w300,
            //                         fontSize: 10.sp),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            //   startChild: Container(
            //     // color: Colors.amberAccent,
            //     child: Center(
            //         child: Text(
            //       "Day 2",
            //       style: TextStyle(
            //           color: kSigninColor,
            //           fontWeight: FontWeight.w600,
            //           fontSize: 11.sp,
            //           height: 2),
            //     )),
            //   ),
            // ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
