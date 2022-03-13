import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 5.sp),
          child: Container(
            margin: EdgeInsets.only(top: 1.4.h, bottom: 1.4.h, left: 2.w, right: 2.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            child:  Builder(builder: (context) =>  IconButton(
              onPressed: ()=> Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_rounded, size: 12.sp,),
            ),),
          ),
        ),
        backgroundColor: Colors.black,
        title: Text("30 Days Progress", style: TextStyle(fontSize: 16.sp),),
        actions: [
          Icon(Icons.more_horiz, size: 24.sp,),
          SizedBox(width: 5.sp,),
        ],
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 2.h,),
              Container(
                height: 33.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: kLightColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kSigninColor, width: 1.sp),
                ),
                child: Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: MyHomeScreen()),
              ),
              ProgressCard(img: "assets/watergreen.png", type: "  Water", score: "  483", hading: "Glass drink in 30 days\n", description: "Lorem ipsum is simply dummy text is that readable",),
              ProgressCard(img: "assets/Vector (7).png", type: "  Walk Steps", score: "  58,483", hading: "Walk Step in 30 days\n", description: "Lorem ipsum is simply dummy text is that readable",),
              ProgressCard(img: "assets/watergreen.png", type: "  Food", score: "  8,976", hading: "Minetal in 30 days\n", description: "Lorem ipsum is simply dummy text is that readable",),

            ],
          ),
        )
      ),
    );
  }
}
// class SalesData {
//   SalesData(this.year, this.sales);
//   final String year;
//   final double sales;
// }