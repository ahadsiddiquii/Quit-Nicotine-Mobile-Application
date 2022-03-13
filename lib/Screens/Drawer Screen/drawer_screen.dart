import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nicotine/Constant.dart';
import 'package:nicotine/Screens/Forum/forum_screen.dart';
import 'package:nicotine/Screens/Home%20Screens/calender_screen.dart';
import 'package:nicotine/Screens/Home%20Screens/dash_bord.dart';
import 'package:nicotine/Screens/Home%20Screens/goals_screen.dart';
import 'package:nicotine/Screens/Home%20Screens/profile_screen.dart';
import 'package:nicotine/Screens/Shop%20Screen/shop_screen.dart';
import 'package:sizer/sizer.dart';

import '../my_activity.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      // width: 40.w,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 6.h,),
        Container(
          child: Image.asset("assets/qnl4.png"),
        ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DashBord()));
            },
            child: Container(
                width: 48.w,
                child: Text("Monitor Your Activity", style: TextStyle(color: Colors.white, fontSize: 13.sp),)),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ForumScreen(),),);
            },
            child: Container(
                width: 48.w,
                child: Text("Forum", style: TextStyle(color: Colors.white, fontSize: 13.sp),)),
          ),
          GestureDetector( //MyActivity
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyActivity(),),);
            },
            child: Container(
                width: 48.w,
                child: Text("My Activity", style: TextStyle(color: Colors.white, fontSize: 13.sp),)),
          ),
          GestureDetector(//GoalsScreen(),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GoalsScreen(show_appbar: true,),),);
            },
            child: Container(
                width: 48.w,
                child: Text("My Goal", style: TextStyle(color: Colors.white, fontSize: 13.sp),)),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CalenderScreen(show_appbar: true,)),);
            },
            child: Container(
                width: 48.w,
                child: Text("Calendar", style: TextStyle(color: Colors.white, fontSize: 13.sp),)),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShopScreen()),);
            },
            child: Container(
                width: 48.w,
                child: Text("Shop", style: TextStyle(color: Colors.white, fontSize: 13.sp),)),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()),);
            },
            child: Container(
                width: 48.w,
                child: Text("Profile", style: TextStyle(color: Colors.white, fontSize: 13.sp),)),
          ),
          Container(
              width: 48.w,
              child: Text("Log Out", style: TextStyle(color: kSignupColor, fontSize: 13.sp),)),
          SizedBox(height: 6.h,),
      ],),
    );
  }
}
