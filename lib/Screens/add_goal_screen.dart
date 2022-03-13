import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../Constant.dart';

class AddGoalScreen extends StatefulWidget {
  const AddGoalScreen({Key? key}) : super(key: key);

  @override
  _AddGoalScreenState createState() => _AddGoalScreenState();
}

class _AddGoalScreenState extends State<AddGoalScreen> {
  TextEditingController goal_name_1 = TextEditingController();
  TextEditingController goal_name_2 = TextEditingController();
  TextEditingController status = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? selectedValue;
  List<String> items = [
    '120 Days',
    '90 Days',
    '30 Days',
  ];

  String? selectedValue2;
  List<String> items2 = [
    '10 min',
    '20 min',
    '30 min',
    '40 min',
    '50 min',
    '60 min',
  ];
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
        title: Text("Add Goal", style: TextStyle(fontSize: 16.sp),),
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                          SizedBox(height: 6.h,),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            margin: EdgeInsets.only(top: 3.h),
                            // color: Colors.pink,
                            child: TextFormField(
                              controller: goal_name_1,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 5,
                              // validator: ,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: kLightColor,
                                hintText: "Enter Goal Name",
                                hintStyle: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
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
                                prefixIcon: Image.asset("assets/Work.png", color: kSignupColor,)
                              ),
                            ),
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            margin: EdgeInsets.only(top: 3.h),
                            // color: Colors.pink,
                            child: TextFormField(
                              controller: goal_name_2,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 5,
                              // validator: ,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: kLightColor,
                                hintText: "Goal Name",
                                hintStyle: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                                // contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 0.6,
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
                                prefixIcon: Image.asset("assets/Document.png", color: kSignupColor,)
                              ),
                            ),
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            margin: EdgeInsets.only(top: 3.h),
                            // color: Colors.pink,
                            child: TextFormField(
                              controller: status,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 5,
                              // validator: ,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: kLightColor,
                                hintText: "Status",
                                hintStyle: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                                // contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 0.6,
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
                                prefixIcon: Image.asset("assets/Graph.png", color: kSignupColor,)
                              ),
                            ),
                          ),
                    SizedBox(height: 3.h,),
                  ],
                ),
              ),
              Container(
                height: 7.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: kLightColor,
                  border: Border.all(width: 0.6.sp, color: kSignupColor),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 2.w, right: 1.w),
                      child: Image.asset("assets/Calendar.png", color: kSignupColor,),
                    ),
                    Expanded(
                      child: Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Text(
                              'Choose Days',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: items
                                .map((item) =>
                                DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            iconSize: 30,
                            iconEnabledColor: Colors.white,
                            iconDisabledColor: Colors.white60,
                            buttonHeight: 50,
                            buttonWidth: 160,
                            buttonPadding: const EdgeInsets.only(left: 8, right: 14),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(
                              //   color: kSignupColor,
                              // ),
                              color: kLightColor,
                            ),
                            buttonElevation: 0,
                            itemHeight: 40,
                            itemPadding: const EdgeInsets.only(left: 14, right: 14),
                            dropdownMaxHeight: 200,
                            dropdownWidth: 30.w,
                            dropdownPadding: null,
                            dropdownDecoration: BoxDecoration(
                              border: Border.all(color: kSignupColor, width: 1.3),
                              borderRadius: BorderRadius.circular(14),
                              color: kLightColor,
                            ),
                            dropdownElevation: 8,
                            scrollbarRadius: const Radius.circular(40),
                            scrollbarThickness: 6,
                            scrollbarAlwaysShow: true,
                            offset: const Offset(180, 20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 7.h,
                width: 90.w,
                margin: EdgeInsets.only(top: 3.h),
                // color: Colors.pink,
                child: TextFormField(
                  controller: status,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 5,
                  // validator: ,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: kLightColor,
                      hintText: "Status",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                      // contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0.6,
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
                      prefixIcon: Image.asset("assets/Calendar.png", color: kSignupColor,),
                      suffixIcon: Image.asset("assets/Calendar.png", color: Colors.white60,)
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Container(
                height: 7.h,
                width: 90.w,
                decoration: BoxDecoration(
                    color: kLightColor,
                    border: Border.all(width: 0.6.sp, color: kSignupColor),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 3.w, right: 1.w),
                      child: Image.asset("assets/fi-rr-alarm-clock 1.png", color: kSignupColor,),
                    ),
                    Expanded(
                      child: Container(
                        // width: .w,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Text(
                              'Time Slot',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: items2
                                .map((item2) =>
                                DropdownMenuItem<String>(
                                  value: item2,
                                  child: Text(
                                    item2,
                                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                                .toList(),
                            value: selectedValue2,
                            onChanged: (value) {
                              setState(() {
                                selectedValue2 = value as String;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            iconSize: 30,
                            iconEnabledColor: Colors.white,
                            iconDisabledColor: Colors.white60,
                            buttonHeight: 50,
                            buttonWidth: 160,
                            buttonPadding: const EdgeInsets.only(left: 8, right: 14),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(
                              //   color: kSignupColor,
                              // ),
                              color: kLightColor,
                            ),
                            buttonElevation: 0,
                            itemHeight: 40,
                            itemPadding: const EdgeInsets.only(left: 14, right: 14),
                            dropdownMaxHeight: 30.h,
                            dropdownWidth: 35.w,
                            dropdownPadding: null,
                            dropdownDecoration: BoxDecoration(
                              border: Border.all(color: kSignupColor, width: 1.3),
                              borderRadius: BorderRadius.circular(14),
                              color: kLightColor,
                            ),
                            dropdownElevation: 8,
                            scrollbarRadius: const Radius.circular(40),
                            scrollbarThickness: 6,
                            scrollbarAlwaysShow: true,
                            offset: const Offset(160, 260),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ),
              SizedBox(height: 7.h,),
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
                  onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentsScreen(),),);
                  },
                  child: Text("Create Goal", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16.sp),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
