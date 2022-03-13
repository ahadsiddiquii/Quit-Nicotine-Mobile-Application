import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nicotine/Constant.dart';
import 'package:sizer/sizer.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({Key? key}) : super(key: key);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 100.h,
          width: 100.w,
          color: Color(0xff18191A),
          child: Column(
            children: [
              Container(
                height: 35.h,
                width: 100.w,
                color: Colors.white,
                child: Stack(
                  children: [
                    Container(
                        height: 35.h,
                        width: 100.w,
                        child: Image.asset(
                          "assets/Mask.png",
                          fit: BoxFit.fill,
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 4.h, bottom: 0, left: 5.w, right: 0),
                      decoration: BoxDecoration(
                        color: Color(0xff505050),
                        // color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child:  Builder(builder: (context) =>  IconButton(
                        onPressed: ()=> Navigator.pop(context),
                        icon: Icon(Icons.arrow_back_ios_rounded, size: 12.sp, color: Colors.white,),
                      ),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
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
                  subtitle: Text("Posted by Alex Ethan", style: TextStyle(color: Colors.white54, fontWeight: FontWeight.w400, fontSize: 10.sp, height: 1.4),),
                ),
              ),
              Container(
                width: 90.w,
                child: Text("Lorem Ipsum is simply dummy text of the printing & typesetting industry.",
                style: TextStyle(color: Colors.white, fontSize: 11.sp, height: 1.6),
                ),
              ),
              SizedBox(height: 1.h,),
              Container(
                width: 90.w,
                child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.white54, fontSize: 10.sp, height: 1.4,),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5.sp, color: Colors.white),
                    top: BorderSide(width: 0.5.sp, color: Colors.white),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 0, right: 0, bottom: 1.h, top: 1.h),
                  child: Row(
                    children: [
                      Container(
                          height: 3.h,
                          width: 6.w,
                          child: Image.asset("assets/Facebook Like.png", fit: BoxFit.fill,)),
                      Text(" 4,341", style: TextStyle(color: Colors.white, fontSize: 10.sp,),),
                      SizedBox(width: 10.w,),
                      Icon(Icons.sms_outlined, size: 20.sp, color: Colors.white,),
                      Text(" 341", style: TextStyle(color: Colors.white, fontSize: 10.sp,),),
                      SizedBox(width: 10.w,),
                      Icon(Icons.share_rounded, color: Colors.white, size: 20.sp,)
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 8.h,
                decoration: BoxDecoration(
                  color: kLightColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: TextFormField(
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.white),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
                    filled: true,
                    fillColor: kLightColor,
                    hintText: "Write Comment",
                    hintStyle: TextStyle(color: Colors.black26, fontSize: 10.sp),
                    contentPadding: EdgeInsets.fromLTRB(20, 50, 0, 30),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: kLightColor,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: kLightColor,
                        // color: Color(0xfff4b41a),
                      ),
                    ),
                    border: InputBorder.none,
                    // focusedBorder: InputBorder.none,
                    // enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
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
