import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../../Constant.dart';
import '../../my_goals_screen.dart';
class GoalsHistory extends StatelessWidget {
  const GoalsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      color: Colors.black,
      child:  ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyGoalsScreen(),),);
              },
              child: Container(
                  margin: EdgeInsets.only(top: 1.h, left: 2.w, right: 2.w),
                  height: 18.h,
                  width: 95.w,
                  decoration: BoxDecoration(
                    // color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1.sp, color: Color(0xffF8DB08)),
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
            );
          }
      ),
    );
  }
}
