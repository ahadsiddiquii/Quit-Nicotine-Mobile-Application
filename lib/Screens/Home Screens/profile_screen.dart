import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nicotine/Constant.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Material(
        child: Container(
          color: Colors.black,
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              SizedBox(height: 2.h,),
              Container(
                height: 10.h,
                width: 20.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kLightColor
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset("assets/profile.png")),
              ),
              Text("Jason Momoa", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14.sp, height: 2),),
              Text("110 Points", style: TextStyle(color: kSignupColor, fontWeight: FontWeight.w400, fontSize: 11.sp, height: 1),),
              SizedBox(height: 2.h,),
              Container(
                height: 5.h,
                width: 35.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5)
                ),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: kSigninColor,
                  onPressed: (){},
                  child: Text("Edit profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.sp),),
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                margin: EdgeInsets.only(top: 1.h),
                width: 90.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: kLightColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: ListTile(
                    leading: Container(
                        height: 5.5.h,
                        width: 11.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red.withOpacity(0.2)
                        ),
                        child: Icon(Icons.person_outline_rounded, color: kSignupColor, size: 20.sp,)),
                    title: Text("Jason Momoa", style: TextStyle(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w400,),),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 1.h),
                width: 90.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: kLightColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: ListTile(
                    leading: Container(
                        height: 5.5.h,
                        width: 11.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red.withOpacity(0.2)
                        ),
                        child: Icon(Icons.email_outlined, color: kSignupColor, size: 20.sp,)),
                    title: Text("Jasonmomoa@gmail.com", style: TextStyle(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w400,),),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 1.h),
                width: 90.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: kLightColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: ListTile(
                    leading: Container(
                        height: 5.5.h,
                        width: 11.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red.withOpacity(0.2)
                        ),
                        child: Icon(Icons.lock_outline, color: kSignupColor, size: 20.sp,)),
                    title: Text("******************", style: TextStyle(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w400,),),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h,),
                width: 90.w,
                child: Text("My Mistakes", style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w400),),
              ),
              Container(
                margin: EdgeInsets.only(top: 1.h),
                width: 90.w,
                height: 18.h,
                decoration: BoxDecoration(
                    color: kLightColor,
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h),
                width: 90.w,
                height: 8.h,
                decoration: BoxDecoration(
                    color: kLightColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: ListTile(
                    leading: Container(
                        height: 5.5.h,
                        width: 11.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red.withOpacity(0.2)
                        ),
                        child: Icon(Icons.logout, color: kSignupColor, size: 20.sp,)),
                    title: Text("Logout", style: TextStyle(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w400,),),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.black26,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
