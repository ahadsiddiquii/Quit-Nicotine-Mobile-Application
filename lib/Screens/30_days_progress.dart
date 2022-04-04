import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nicotine/Screens/Components/backButton.dart';
import 'package:nicotine/blocs/Activity/activity_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Constant.dart';
import 'Components/graph.dart';
import 'Components/progress_card.dart';

class DaysProgress extends StatefulWidget {
  const DaysProgress({Key? key}) : super(key: key);

  @override
  _DaysProgressState createState() => _DaysProgressState();
}

class _DaysProgressState extends State<DaysProgress> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final activityState = BlocProvider.of<ActivityBloc>(context).state;
    int waterCount = 0;
    int stepsCount = 0;
    int foodCount = 0;
    if (activityState is UserActivitiesRetrieved) {
      final thirtyDaysBegin = DateTime.now().subtract(Duration(days: 30));
      activityState.activities.forEach((element) {
        if (element.activityCreationDate!.isAfter(thirtyDaysBegin)) {
          waterCount = waterCount + element.glassesOfWater!;
          foodCount = foodCount + 878;
          stepsCount = stepsCount + element.stepsWalked!;
        }
      });
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: backButton(context),
        // Padding(
        //   padding: EdgeInsets.only(left: 5.sp),
        //   child: Container(
        //     margin: EdgeInsets.only(top: 1.4.h, bottom: 1.4.h, left: 2.w, right: 2.w),
        //     decoration: BoxDecoration(
        //       color: Colors.black.withOpacity(0.1),
        //       borderRadius: BorderRadius.circular(50),
        //     ),
        //     child:  Builder(builder: (context) =>  IconButton(
        //       onPressed: ()=> Navigator.pop(context),
        //       icon: Icon(Icons.arrow_back_ios_rounded, size: 12.sp,),
        //     ),),
        //   ),
        // ),
        backgroundColor: Colors.white,
        title: Text(
          "30 Days Progress",
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
        ),
        actions: [
          Icon(
            Icons.more_horiz,
            size: 24.sp,
          ),
          SizedBox(
            width: 5.sp,
          ),
        ],
      ),
      body: Container(
          height: 100.h,
          width: 100.w,
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 33.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 3.0,
                      ),
                    ],
                    color: Colors.white,
                    // kLightColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kSigninColor, width: 1.sp),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(5.sp), child: MyHomeScreen()),
                ),
                ProgressCard(
                  img: "assets/watergreen.png",
                  type: "  Water",
                  score: " ${waterCount.toString()}",
                  // "  483",
                  hading: "Glass drink in 30 days\n",
                  description:
                      "Lorem ipsum is simply dummy text is that readable",
                ),
                ProgressCard(
                  img: "assets/Vector (7).png",
                  type: "  Walk Steps",
                  score: " ${stepsCount.toString()}",
                  // "  58,483",
                  hading: "Walk Step in 30 days\n",
                  description:
                      "Lorem ipsum is simply dummy text is that readable",
                ),
                ProgressCard(
                  img: "assets/watergreen.png",
                  type: "  Food",
                  score: " ${foodCount.toString()}",
                  // "  8,976",
                  hading: "Mineral in 30 days\n",
                  description:
                      "Lorem ipsum is simply dummy text is that readable",
                ),
              ],
            ),
          )),
    );
  }
}
// class SalesData {
//   SalesData(this.year, this.sales);
//   final String year;
//   final double sales;
// }