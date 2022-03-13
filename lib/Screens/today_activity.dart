import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Constant.dart';
import 'my_activity.dart';

class TodayActivity extends StatefulWidget {
  const TodayActivity({Key? key}) : super(key: key);

  @override
  _TodayActivityState createState() => _TodayActivityState();
}

class _TodayActivityState extends State<TodayActivity> {
  TextEditingController drink = TextEditingController();
  TextEditingController eat = TextEditingController();
  TextEditingController walk = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
        title: Text("Today Activity", style: TextStyle(fontSize: 16.sp),),
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
              SizedBox(height: 3.h,),
              Container(
                margin: EdgeInsets.only(left: 25.w),
                height: 25.h,
                width: 65.w,
                // color: Colors.lightGreenAccent,
                child: Image.asset("assets/activity_tracker.png", fit: BoxFit.fill,),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text("How Much Glass of Esyer You Drink Today", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),) ,
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            // margin: EdgeInsets.symmetric(horizontal: 5.w),
                            // color: Colors.pink,
                            child: TextFormField(
                              controller: drink,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 5,
                              // validator: ,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: kLightColor,
                                  hintText: "Water",
                                  hintStyle: TextStyle(color: Colors.white70, fontSize: 12.sp, fontWeight: FontWeight.w300),
                                  // contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 0.6.sp,
                                        color: kSignupColor,
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: kSignupColor,
                                      width: 0.5.sp,
                                    ),
                                  ),
                                  prefixIcon: Image.asset("assets/water.png", color: kSignupColor,)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.h,),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text("What Food You Eat Today", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),) ,
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            // margin: EdgeInsets.symmetric(horizontal: 5.w),
                            // color: Colors.pink,
                            child: TextFormField(
                              controller: eat,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 5,
                              // validator: ,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: kLightColor,
                                  hintText: "Noodles",
                                  hintStyle: TextStyle(color: Colors.white70, fontSize: 12.sp, fontWeight: FontWeight.w300),
                                  // contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 0.6.sp,
                                        color: kSignupColor,
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: kSignupColor,
                                      width: 0.5.sp,
                                    ),
                                  ),
                                  prefixIcon: Image.asset("assets/nodels.png", color: kSignupColor,)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.h,),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text("How Much Steps You Walk Today", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),) ,
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            // margin: EdgeInsets.symmetric(horizontal: 5.w),
                            // color: Colors.pink,
                            child: TextFormField(
                              controller: walk,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              maxLines: 5,
                              // validator: ,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: kLightColor,
                                  hintText: "6,000",
                                  hintStyle: TextStyle(color: Colors.white70, fontSize: 12.sp, fontWeight: FontWeight.w300),
                                  // contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 0.6.sp,
                                        color: kSignupColor,
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: kSignupColor,
                                      width: 0.5.sp,
                                    ),
                                  ),
                                  prefixIcon: Image.asset("assets/person.png", color: kSignupColor,)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Container(
                height: 7.h,
                width: 65.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: kSignupColor,
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                          // alignment: Alignment.bottomCenter,
                          backgroundColor: kLightColor,
                          titlePadding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          title: GestureDetector(
                            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyActivity())),
                            child: Container(
                              height: 18.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  color: kLightColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: kSignupColor, width: 1.sp)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 8.h,
                                    width: 16.w,
                                    child: Image.asset("assets/activitey.png", fit: BoxFit.fill,),
                                  ),
                                  Text("Your Earn 10 Points", style: TextStyle(color: kSigninColor, fontSize: 12.sp, fontWeight: FontWeight.w500, height: 2),),
                                  Text("Cancel", style: TextStyle(color: Colors.white, fontSize: 11.sp, fontWeight: FontWeight.w400, height: 2),),
                                ],
                              ),
                            ),
                          )
                      ),
                    );
                    // _animationController.reset();
                    // _animationController.forward();
                  },
                  child: Text("Upload", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15.sp),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
