import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nicotine/Constant.dart';
import 'package:nicotine/Screens/my_goals_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'components/status_card.dart';
import 'components/timer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(height: 2.h,),
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
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Timer(time: 30, title: "DAYS",),
                Text(":", style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 28.sp)),
                Timer(time: 12, title: "HOURS",),
                Text(":", style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 28.sp)),
                Timer(time: 18, title: "MINUTES",),
                Text(":", style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 28.sp)),
                Timer(time: 22, title: "SECONDS",),
              ],
            ),

          ),
          SizedBox(height: 2.h,),
          Container(
            width: 95.w,
            child: Text("My Goals", style: TextStyle(color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.w600),),
          ),
          SizedBox(height: 1.h,),
          Container(
            // height: 30.h,
            // color: Colors.cyanAccent,
            width: 95.w,
            child:Table(
              border: TableBorder.all(color: Colors.black),
              children: [
                TableRow(children: [
                  StatusCard(status: "Running", goal: "2",),
                  StatusCard(status: "In process", goal: "2",),
                ]),
                TableRow(children: [
                  StatusCard(status: "Complete", goal: "0",),
                  StatusCard(status: "Cancel", goal: "0",),
                ])
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            width: 95.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // width: 50.w,
                  child: Text("Latest Goals", style: TextStyle(color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.w600),),
                ),
                Container(
                  // width: 30.w,
                  child: Text("See More", style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w500),),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyGoalsScreen()));
            },
            child: Container(
              height: 18.h,
              width: 95.w,
              decoration: BoxDecoration(
                // color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                  color: kSigninColor,
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Text("Quit Nicotine", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18.sp),)),
                  SizedBox(height: 1.h,),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Text("Progress", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 11.sp),),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child:  LinearPercentIndicator(
                          width: 75.w,
                          // width: MediaQuery.of(context).size.width - 50,
                          animation: true,
                          lineHeight: 1.6.h,
                          animationDuration: 2000,
                          percent: 0.45,
                          center: Text("45%", style: TextStyle(color: Colors.white, fontSize: 9.sp, fontWeight: FontWeight.w500, height: 1),),
                          // linearStrokeCap: LinearStrokeCap.roundAll,
                          barRadius: Radius.circular(20),
                          // curve: Curves.linear,
                          progressColor: kSignupColor,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,),
                      SizedBox(width: 1.sp,)
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    // width: 60.w,
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today_rounded, color: kSignupColor,),
                        Text("  120 Days", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 11.sp),),
                        Spacer(),
                        Icon(Icons.access_time, color: kSignupColor,),
                        Text("  20 min time Slots", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 11.sp),),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h,),
                ],
              )
            ),
          ),
     ]
      ),
    );
  }
}
