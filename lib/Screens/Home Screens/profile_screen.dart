import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nicotine/Constant.dart';
import 'package:nicotine/Screens/login_screen.dart';
import 'package:nicotine/blocs/Activity/activity_bloc.dart';
import 'package:nicotine/blocs/shopitem/shopitem_bloc.dart';
import 'package:nicotine/resources/firebase_services/OnBoardingFirestoreService.dart';
import 'package:sizer/sizer.dart';

import '../../blocs/Forum/forum_bloc.dart';
import '../../blocs/User/user_bloc.dart';
import '../../utils/local_storage.dart';
import '../../utils/validators.dart';
import '../Components/backButton.dart';

class ProfileScreen extends StatefulWidget {
  bool fromDrawer;

  ProfileScreen({
    required this.fromDrawer,
  });
  // const ProfileScreen({fromDrawer: fromDrawer, Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mistake = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    final userState = BlocProvider.of<UserBloc>(context).state;
    if (userState is UserLoggedIn) {
      name.text = userState.user.userName!;
      email.text = userState.user.userEmail!;
      password.text = userState.user.userPassword!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ((widget.fromDrawer))
          ? AppBar(
              centerTitle: true,
              elevation: 0,
              leading: backButton(context),
              //  Padding(
              //   padding: EdgeInsets.only(left: 5.sp),
              //   child: Container(
              //     margin: EdgeInsets.only(
              //         top: 1.4.h, bottom: 1.4.h, left: 2.w, right: 2.w),
              //     decoration: BoxDecoration(
              //       color: Colors.white.withOpacity(0.1),
              //       borderRadius: BorderRadius.circular(50),
              //     ),
              //     child: Builder(
              //       builder: (context) => IconButton(
              //         onPressed: () => Navigator.pop(context),
              //         icon: Icon(
              //           Icons.arrow_back_ios_rounded,
              //           size: 12.sp,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              backgroundColor: Colors.white,
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 16.sp, color: Colors.black),
              ),
              actions: [],
            )
          : null,
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserInitial) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          }
        },
        builder: (context, state) {
          if (state is UserLoggedIn) {
            return Container(
              height: 100.h,
              width: 100.w,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Material(
                  child: Container(
                    color: Colors.white,
                    height: 100.h,
                    width: 100.w,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            height: 10.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[300]),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(state.user.userImage!)
                                // Image.asset("assets/profile.png")
                                ),
                          ),
                          Text(
                            state.user.userName!,
                            // "Hassannew",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                height: 2),
                          ),
                          Text(
                            "${state.user.userPoints!.toString()} Points",
                            // "0 Points",
                            style: TextStyle(
                                color: kSignupColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp,
                                height: 1),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            height: 5.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              color: kSigninColor,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<UserBloc>(context).add(
                                      UpdateProfile(
                                          user: state.user,
                                          email: email.text,
                                          fullName: name.text,
                                          password: state.user.userPassword!,
                                          mistake: mistake.text));
                                } else {
                                  print("Error in Validation");
                                }
                                // OnBoardingFirestoreService
                                //     onBoardingFirestoreService =
                                //     OnBoardingFirestoreService();
                                // Map<String, dynamic> userMap = {
                                //   "userId": "Hassan_hassan@gmail.com",
                                //   "userName": "Hassannew",
                                //   "password": "Hassan1234.",
                                //   "points": 0,
                                // };
                                // onBoardingFirestoreService.createUser(
                                //     "Hassan_hassan@gmail.com", userMap);
                              },
                              child: Text(
                                "Edit profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(top: 1.h),
                          //   width: 90.w,
                          //   height: 8.h,
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   child: Center(
                          //     child: ListTile(
                          //       leading: Container(
                          //           height: 5.5.h,
                          //           width: 11.w,
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(10),
                          //               color: Colors.red.withOpacity(0.2)),
                          //           child: Icon(
                          //             Icons.person_outline_rounded,
                          //             color: kSignupColor,
                          //             size: 20.sp,
                          //           )),
                          //       title: Text(
                          //         "Hassannew",
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //           fontSize: 13.sp,
                          //           fontWeight: FontWeight.w400,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Container(
                            // height: 10.h,
                            width: 90.w,
                            child: TextFormField(
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
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                      height: 5.5.h,
                                      width: 11.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.red.withOpacity(0.2)),
                                      child: Icon(
                                        Icons.person_outline_rounded,
                                        color: kSignupColor,
                                        size: 20.sp,
                                      )),
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 0, 0, 0),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 0.5.sp,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            // height: 10.h,
                            width: 90.w,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Email';
                                }
                                if (!validateStructureEmail(value)) {
                                  return "Please enter an email with correct format";
                                }
                                return null;
                              },
                              controller: email,
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              // validator: ,

                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                      height: 5.5.h,
                                      width: 11.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.red.withOpacity(0.2)),
                                      child: Icon(
                                        Icons.email_outlined,
                                        color: kSignupColor,
                                        size: 20.sp,
                                      )),
                                ),
                                suffixIcon: Icon(
                                  Icons.check,
                                  color: validateStructureEmail(email.text) &&
                                          email.text.isNotEmpty
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 0, 0, 0),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 0.5.sp,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            // height: 10.h,
                            width: 90.w,
                            child: TextFormField(
                              enabled: false,
                              obscureText: true,

                              controller: password,
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              // validator: ,

                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                      height: 5.5.h,
                                      width: 11.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.red.withOpacity(0.2)),
                                      child: Icon(
                                        Icons.lock_outline,
                                        color: kSignupColor,
                                        size: 20.sp,
                                      )),
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 0, 0, 0),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 0.5.sp,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),

                          // Container(
                          //   margin: EdgeInsets.only(top: 1.h),
                          //   width: 90.w,
                          //   height: 8.h,
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   child: Center(
                          //     child: ListTile(
                          //       leading: Container(
                          //           height: 5.5.h,
                          //           width: 11.w,
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(10),
                          //               color: Colors.red.withOpacity(0.2)),
                          //           child: Icon(
                          //             Icons.email_outlined,
                          //             color: kSignupColor,
                          //             size: 20.sp,
                          //           )),
                          //       title: Text(
                          //         "hassan@gmail.com",
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //           fontSize: 13.sp,
                          //           fontWeight: FontWeight.w400,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   margin: EdgeInsets.only(top: 1.h),
                          //   width: 90.w,
                          //   height: 8.h,
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   child: Center(
                          //     child: ListTile(
                          //       leading: Container(
                          //           height: 5.5.h,
                          //           width: 11.w,
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(10),
                          //               color: Colors.red.withOpacity(0.2)),
                          //           child: Icon(
                          //             Icons.lock_outline,
                          //             color: kSignupColor,
                          //             size: 20.sp,
                          //           )),
                          //       title: Text(
                          //         "******************",
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //           fontSize: 13.sp,
                          //           fontWeight: FontWeight.w400,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 2.h,
                            ),
                            width: 90.w,
                            child: Text(
                              "My Mistakes",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            // height: 10.h,
                            width: 90.w,
                            child: TextFormField(
                              controller: mistake,
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              // validator: ,
                              maxLines: 5,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 20, 20, 20),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 0.5.sp,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(top: 1.h),
                          //   width: 90.w,
                          //   height: 18.h,
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(10)),
                          // ),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<ForumBloc>(context)
                                  .add(ResetForumState());

                              BlocProvider.of<ActivityBloc>(context)
                                  .add(ResetActivityState());
                              BlocProvider.of<UserBloc>(context).add(Logout());
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 2.h),
                              width: 90.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: ListTile(
                                  leading: Container(
                                      height: 5.5.h,
                                      width: 11.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.red.withOpacity(0.2)),
                                      child: Icon(
                                        Icons.logout,
                                        color: kSignupColor,
                                        size: 20.sp,
                                      )),
                                  title: Text(
                                    "Logout",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
