import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nicotine/Constant.dart';
import 'package:sizer/sizer.dart';

class ProgressCard extends StatelessWidget {
 final String img;
 final String type;
 final String score;
 final String hading;
 final String description;

  const ProgressCard({Key? key,
    required  this.img,
     required this.type,
     required this.score,
     required this.hading,
     required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.h),
      height: 20.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: kLightColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kSigninColor, width: 1.sp),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Image.asset(img),
                  Text(type, style: TextStyle(color: kSignupColor, fontWeight: FontWeight.w300, fontSize: 12.sp),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(score, style: TextStyle(color: Color(0xffF8DB08), fontSize: 25.sp, height: 2.5),),
                  Container(
                    width: 45.w,
                    child: RichText(
                      text: TextSpan(
                        text: hading,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white54, height: 2.4, fontSize: 12.sp),
                        children:  <TextSpan>[
                          TextSpan(text: description, style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, height: 1.3, fontSize: 12.sp)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
