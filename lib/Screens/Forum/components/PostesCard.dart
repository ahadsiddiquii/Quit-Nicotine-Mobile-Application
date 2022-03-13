import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nicotine/Constant.dart';
import 'package:sizer/sizer.dart';

import '../post_detail_screen.dart';

class PostesCard extends StatelessWidget {
  const PostesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetailScreen(),),);
      },
      child: Container(
        margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 3.h),
        width: 94.w,
        decoration: BoxDecoration(
          color: kLightColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Container(
              // color: Colors.white,
              // width: 80.w,
              child: ListTile(
                leading: Container(
                  height: 6.h,
                  width: 12.w,
                  // margin: EdgeInsets.only(top: 7),
                  decoration: BoxDecoration(
                    color: Color(0xffD3D3D3),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                title: Text("Jason Momoa", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14.sp, height: 1.4),),
                subtitle: Text("Posted by Alex Ethan", style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w400, fontSize: 10.sp, height: 1.4),),
              ),
            ),
            Container(
              width: 85.w,
              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              style: TextStyle(color: Colors.white, fontSize: 11.sp, height: 1.4),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.h),
              height: 22.h,
              width: 85.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/Mask.png", fit: BoxFit.fill,),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 1.5.h,),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5.sp, color: Colors.white),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 1.h),
                child: Row(
                  children: [
                    Container(
                        height: 3.h,
                        width: 6.w,
                        child: Image.asset("assets/Facebook Like.png", fit: BoxFit.fill,)),
                    Text("4,341", style: TextStyle(color: Colors.white, fontSize: 10.sp,),),
                    SizedBox(width: 10.w,),
                    Icon(Icons.sms_outlined, size: 22.sp, color: Colors.white,),
                    Text("341", style: TextStyle(color: Colors.white, fontSize: 10.sp,),),
                    SizedBox(width: 10.w,),
                    Icon(Icons.share_rounded, color: Colors.white, size: 22.sp,)
                  ],
                ),
              ),
            ),
            Container(
              height: 5.h,
              margin: EdgeInsets.only(left: 5.w, bottom: 1.h),
              child: TextFormField(
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.white),
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Write Comment",
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 10.sp),
                  // contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 30),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
