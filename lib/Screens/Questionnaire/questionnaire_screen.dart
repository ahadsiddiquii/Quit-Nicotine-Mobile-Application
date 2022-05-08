import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../Constant.dart';
import '../../blocs/User/user_bloc.dart';
import '../../utils/date_util.dart';
import '../Components/backButton.dart';
import 'questionnaire_screen_2.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController street_address = TextEditingController();
  TextEditingController address_line_2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController post_code = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController date_of_birth = TextEditingController();
  TextEditingController place_of_birth = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController start_smoke = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime addedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    final userState = BlocProvider.of<UserBloc>(context).state;
    if (userState is UserShowQuestions) {
      name.text = userState.user.userName!;
      email.text = userState.user.userEmail!;
      date_of_birth.text = formatterMonDateYear.format(addedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    void pickDateDialogue() {
      showCupertinoModalPopup(
          context: context,
          builder: (_) => Container(
              height: 250,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(children: [
                Container(
                  height: 240,
                  child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      minimumDate: DateTime(1900, 12, 31, 0, 0),
                      initialDateTime: DateTime.now(),
                      maximumDate: DateTime.now(),
                      onDateTimeChanged: (val) {
                        setState(() {
                          addedDate = val;
                          date_of_birth.text =
                              formatterMonDateYear.format(addedDate);
                        });
                      }),
                )
              ])));
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: backButton(context),
        backgroundColor: Colors.white,
        title: Text(
          "Questionnaire",
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
        ),
        actions: [
          // Icon(
          //   Icons.more_horiz,
          //   size: 24.sp,
          // ),
          // SizedBox(
          //   width: 5.sp,
          // ),
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserShowQuestions) {
            return Container(
              height: 100.h,
              width: 100.w,
              color: Colors.white,
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
                                  height: 3.h,
                                  width: 90.w,
                                  // color: Colors.purple,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Name ',
                                      style: TextStyle(
                                          color: Colors.black,
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
                                  // height: 7.h,
                                  width: 90.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    enabled: false,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter name';
                                      }
                                      return null;
                                    },
                                    controller: name,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 0.3.sp,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
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
                            child: Column(
                              children: [
                                Container(
                                  height: 3.h,
                                  width: 90.w,
                                  // color: Colors.purple,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Address ',
                                      style: TextStyle(
                                          color: Colors.black,
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
                                  // height: 7.h,
                                  width: 90.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter address';
                                      }
                                      return null;
                                    },
                                    controller: address,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 0.3.sp,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
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
                            child: Column(
                              children: [
                                Container(
                                  height: 3.h,
                                  width: 90.w,
                                  // color: Colors.purple,
                                  child: Text(
                                    "Street Address",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.sp),
                                  ),
                                ),
                                Container(
                                  // height: 7.h,
                                  width: 90.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    controller: street_address,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 0.3.sp,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
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
                            child: Column(
                              children: [
                                Container(
                                  height: 3.h,
                                  width: 90.w,
                                  // color: Colors.purple,
                                  child: Text(
                                    "Address Line 2",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.sp),
                                  ),
                                ),
                                Container(
                                  // height: 7.h,
                                  width: 90.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    controller: address_line_2,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
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
                            child: Column(
                              children: [
                                Container(
                                  height: 3.h,
                                  width: 90.w,
                                  // color: Colors.purple,
                                  child: Text(
                                    "City",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.sp),
                                  ),
                                ),
                                Container(
                                  // height: 7.h,
                                  width: 90.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    controller: city,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
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
                            child: Column(
                              children: [
                                Container(
                                  height: 3.h,
                                  width: 90.w,
                                  // color: Colors.purple,
                                  child: Text(
                                    "Country",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.sp),
                                  ),
                                ),
                                Container(
                                  // height: 7.h,
                                  width: 90.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    controller: country,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 0.3.sp,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
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
                            child: Column(
                              children: [
                                Container(
                                  height: 3.h,
                                  width: 90.w,
                                  // color: Colors.purple,
                                  child: Text(
                                    "Postal Code",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.sp),
                                  ),
                                ),
                                Container(
                                  // height: 7.h,
                                  width: 90.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    controller: post_code,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 0.3.sp,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
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
                            child: Column(
                              children: [
                                Container(
                                  height: 3.h,
                                  width: 90.w,
                                  // color: Colors.purple,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Email ',
                                      style: TextStyle(
                                          color: Colors.black,
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
                                ),
                                Container(
                                  // height: 7.h,
                                  width: 90.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter email';
                                      }
                                      return null;
                                    },
                                    enabled: false,
                                    controller: email,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 0.3.sp,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
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
                            child: Column(
                              children: [
                                Container(
                                  height: 3.h,
                                  width: 90.w,
                                  // color: Colors.purple,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Phone ',
                                      style: TextStyle(
                                          color: Colors.black,
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
                                ),
                                Container(
                                  // height: 7.h,
                                  width: 90.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter phone noumber';
                                      }
                                      return null;
                                    },
                                    controller: phone,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.phone,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 0.3.sp,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          GestureDetector(
                            onTap: pickDateDialogue,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 3.h,
                                    width: 90.w,
                                    // color: Colors.purple,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Date of Birth ',
                                        style: TextStyle(
                                            color: Colors.black,
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
                                    // height: 7.h,
                                    width: 90.w,
                                    // margin: EdgeInsets.only(top: 5.sp),
                                    // color: Colors.pink,
                                    child: TextFormField(
                                      enabled: false,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter date of birth';
                                        }
                                        return null;
                                      },
                                      // inputFormatters: [
                                      //   FilteringTextInputFormatter.allow(RegExp(
                                      //       r'^(0[1-9]|1[0-9]|2[0-9]|3[01])-/.-/.$')),
                                      // ],

                                      controller: date_of_birth,
                                      cursorColor: Colors.black,
                                      style: TextStyle(color: Colors.black),
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.datetime,
                                      // validator: ,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            )),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 0.3.sp,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                      text: 'Place of Birth ',
                                      style: TextStyle(
                                          color: Colors.black,
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
                                ),
                                Container(
                                  // height: 7.h,
                                  width: 90.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter place of birth';
                                      }
                                      return null;
                                    },
                                    controller: place_of_birth,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 0.3.sp,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Stack(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 3.h,
                                      width: 90.w,
                                      // color: Colors.purple,
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Gender ',
                                          style: TextStyle(
                                              color: Colors.black,
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
                                      // Text("Name", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),) ,
                                    ),
                                    Container(
                                      // height: 7.h,
                                      width: 90.w,
                                      // margin: EdgeInsets.only(top: 5.sp),
                                      // color: Colors.pink,
                                      child: TextFormField(
                                        enabled: false,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter gender';
                                          }
                                          return null;
                                        },
                                        controller: gender,
                                        cursorColor: Colors.black,
                                        style: TextStyle(color: Colors.black),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.text,
                                        // validator: ,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.fromLTRB(20, 0, 0, 0),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              )),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 0.3.sp,
                                            ),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // height: 7.h,
                                width: 90.w,
                                child: DropdownButton<String>(
                                  underline: Container(),
                                  icon: Container(),
                                  items: <String>[
                                    'Male',
                                    'Female',
                                    'Other',
                                    'Rather not say'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      gender.text = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
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
                                      text: 'Height ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.sp),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' (optional/if known)',
                                            style: TextStyle(
                                                color: kSigninColor,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12.sp)),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  // height: 7.h,
                                  width: 90.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    controller: height,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.phone,
                                    // validator: ,

                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 0.3.sp,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
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
                            child: Column(
                              children: [
                                Container(
                                  height: 3.h,
                                  width: 90.w,
                                  // color: Colors.purple,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Weight ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.sp),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' (optional/if known)',
                                            style: TextStyle(
                                                color: kSigninColor,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12.sp)),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  // height: 7.h,
                                  width: 90.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    controller: width,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.phone,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 0.3.sp,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
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
                            child: Column(
                              children: [
                                Container(
                                  height: 3.h,
                                  width: 90.w,
                                  // color: Colors.purple,
                                  child: RichText(
                                    text: TextSpan(
                                      text:
                                          'When did you first started to smoke? ',
                                      style: TextStyle(
                                          color: Colors.black,
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
                                ),
                                Container(
                                  // height: 7.h,
                                  width: 90.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please fill field';
                                      }
                                      return null;
                                    },
                                    controller: start_smoke,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 0.3.sp,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
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
                      width: 30.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: kSignupColor,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionnaireScreen2(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              height: 100.h,
              width: 100.w,
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(kSignupColor),
                  // color: theme.primaryColor,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
