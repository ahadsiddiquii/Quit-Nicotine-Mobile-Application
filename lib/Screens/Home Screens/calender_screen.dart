import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nicotine/Screens/Home%20Screens/components/custom_appbar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Constant.dart';

class CalenderScreen extends StatefulWidget {
  final bool show_appbar;

  const CalenderScreen({Key? key, required this.show_appbar}) : super(key: key);

  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100.h,
        width: 100.w,
        color: Colors.black,
        child: Scaffold(
          extendBody: true,
          // backgroundColor: Colors.white,
          // backgroundColor: Colors.black,
          body: Container(
            color: Colors.black,
            child: Column(
              children: [
                if(widget.show_appbar == true)
                  CustomAppBar(title: "Calender", icon: Icons.more_horiz),
                TableCalendar(
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(color: Colors.white),
                    weekendTextStyle: TextStyle(color: kSignupColor),
                    todayDecoration: BoxDecoration(
                      color: Color(0xffF8DB08),
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                ),
                SizedBox(height: 5.h,),
                Container(
                  width: 90.w,
                  child: Text("25 June, 2021", style: TextStyle(color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.w600),),
                ),
                SizedBox(height: 1.h,),
                Container(
                    margin: EdgeInsets.only(top: 2.h),
                    height: 18.h,
                    width: 95.w,
                    decoration: BoxDecoration(
                      // color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1.sp, color: kSignupColor),
                      color: kLightColor,
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Quit Nicotine", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18.sp),),
                                Text("150 Points", style: TextStyle(color: kSigninColor, fontWeight: FontWeight.w500, fontSize: 12.sp),),

                              ],
                            )),
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
                              Icon(Icons.calendar_today_rounded, color: kSigninColor,),
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
              ],
            ),
          ),
        )
      );
  }
}
