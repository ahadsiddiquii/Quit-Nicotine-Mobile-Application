import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomAppBar({Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3.h),
      height: 8.h,
      // color: Colors.yellow,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white, ),),
            // SizedBox(width: 5.w,),
            Text(title, style: TextStyle(fontSize: 16.sp, color: Colors.white),),
            Icon(icon, size: 26.sp, color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
