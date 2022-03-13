import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../Constant.dart';
import '../subscription_Screen.dart';
import 'questionnaire_screen_2.dart';

class QuestionnaireScreen3 extends StatefulWidget {
  const QuestionnaireScreen3({Key? key}) : super(key: key);

  @override
  _QuestionnaireScreen3State createState() => _QuestionnaireScreen3State();
}

class _QuestionnaireScreen3State extends State<QuestionnaireScreen3> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  TextEditingController c6 = TextEditingController();
  TextEditingController c7 = TextEditingController();
  TextEditingController c8 = TextEditingController();
  TextEditingController c9 = TextEditingController();
  TextEditingController c10 = TextEditingController();
  TextEditingController c11 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  int val3 = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 5.sp),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Questionnaire",
          style: TextStyle(fontSize: 16.sp),
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
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 7.5.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: RichText(
                              text: TextSpan(
                                text:
                                    'If you answered Yes to the previous question, please list any medication you are taking and what they are for.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.sp),
                              ),
                            ),
                            // Text("Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.sp),) ,
                          ),
                          Container(
                            height: 15.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              controller: c1,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 5,
                              // validator: ,
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 0.3.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 3.h,
                      width: 90.w,
                      // color: Colors.purple,
                      child: RichText(
                        text: TextSpan(
                          text: 'Do you have any allergies? ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' (Required)',
                                style: TextStyle(
                                    color: kSignupColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.sp)),
                          ],
                        ),
                      ),
                      // Text("Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.sp),) ,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2.sp, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 4.h,
                            // color: Colors.yellowAccent,
                            child: Row(
                              children: [
                                Container(
                                  width: 10.w,
                                  child: Radio(
                                    // overlayColor: ,
                                    value: 1,
                                    groupValue: val3,
                                    onChanged: (value) {
                                      setState(() {
                                        val3 = int.parse(value.toString());
                                      });
                                    },
                                    activeColor: kSignupColor,
                                  ),
                                ),
                                Text("Yes",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Container(
                            height: 4.h,
                            // color: Colors.yellowAccent,
                            child: Row(
                              children: [
                                Container(
                                  width: 10.w,
                                  child: Radio(
                                    // overlayColor: ,
                                    value: 2,
                                    groupValue: val3,
                                    onChanged: (value) {
                                      setState(() {
                                        val3 = int.parse(value.toString());
                                      });
                                    },
                                    activeColor: kSignupColor,
                                  ),
                                ),
                                Text("No",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 8.h,
                      width: 90.w,
                      // color: Colors.purple,
                      child: RichText(
                        text: TextSpan(
                          text: 'Disclaimer: ',
                          style: TextStyle(
                              color: kSignupColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'If you are pregnant or nursing please check with your doctor before enrolling into this programme.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                      // Text("Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.sp),) ,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 5.5.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: RichText(
                              text: TextSpan(
                                text:
                                    'If you answered Yes to the previous question, please provide details.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.sp),
                              ),
                            ),
                            // Text("Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.sp),) ,
                          ),
                          Container(
                            height: 15.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              controller: c2,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 5,
                              // validator: ,
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 0.3.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 7.5.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text(
                              "Ailments (please select from the list below; if you have more than one health issue please use the space below to add all the relevant information)",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 11.sp),
                            ),
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              enabled: false,
                              controller: c3,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              // validator: ,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: Colors.white,
                                    size: 22.sp,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text(
                              "Muscular/Skeletal/Neurological Disorders",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp),
                            ),
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              enabled: false,
                              controller: c4,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 22.sp,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text(
                              "Dermatological Problems",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp),
                            ),
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              enabled: false,
                              controller: c5,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              // validator: ,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 22.sp,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text(
                              "Internal Problems",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp),
                            ),
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              enabled: false,
                              controller: c6,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              // validator: ,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 22.sp,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text(
                              "Digestive Disorders",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp),
                            ),
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              enabled: false,
                              controller: c7,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              // validator: ,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 22.sp,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text(
                              "Ears, Nose, Throat, Eyes & Hair",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp),
                            ),
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              enabled: false,
                              controller: c8,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              // validator: ,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 22.sp,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text(
                              "Genito-Urinary & Reproductive",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp),
                            ),
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              enabled: false,
                              controller: c9,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              // validator: ,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 22.sp,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text(
                              "Lifestyle Related Problems",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp),
                            ),
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              enabled: false,
                              controller: c10,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              // validator: ,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.3.sp,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 22.sp,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: RichText(
                              text: TextSpan(
                                text: 'Additional Information',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.sp),
                              ),
                            ),
                            // Text("Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.sp),) ,
                          ),
                          Container(
                            height: 15.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              controller: c11,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 5,
                              // validator: ,
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 0.3.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                height: 7.h,
                width: 40.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: kSignupColor,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubscriptionScreen(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Submit Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
