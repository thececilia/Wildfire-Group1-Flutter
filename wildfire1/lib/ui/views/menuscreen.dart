import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wildfire1/ui/views/alivescreen.dart';
import 'package:wildfire1/ui/views/askscreen.dart';
import 'package:wildfire1/ui/views/dashboard/dashboard.dart';
import 'package:wildfire1/ui/views/faqscreen.dart';
import 'package:wildfire1/ui/views/loginscreen.dart';
import 'package:wildfire1/ui/views/profilescreen.dart';
import 'package:wildfire1/ui/views/settingsscreen.dart';
import 'package:wildfire1/ui/views/signuppage.dart';
import 'package:wildfire1/ui/views/updatesscreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wildfire1/utils/popuplogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wildfire1/logic/auth.dart';
import 'package:wildfire1/model/wildfire_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:wildfire1/ui/views/menuscreen.dart';
import 'package:wildfire1/ui/views/reportafire.dart';

import 'inboxscreen.dart';

// final FirebaseAuth auth = FirebaseAuth.instance;

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

TextEditingController lemailController = TextEditingController();
TextEditingController lpasswordController = TextEditingController();

final FocusNode firstNameFocus = FocusNode();
final FocusNode lastNameFocus = FocusNode();
final FocusNode phoneNumberFocus = FocusNode();
final FocusNode emailFocus = FocusNode();
final FocusNode passwordFocus = FocusNode();

final FocusNode lemailFocus = FocusNode();
final FocusNode lpasswordFocus = FocusNode();

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

final GlobalKey<FormState> lformKey = GlobalKey<FormState>();

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter your email address'),
  EmailValidator(errorText: 'Enter a valid email address')
]);

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(6,
      errorText: 'Password must be at least 6 characters long'),
]);

var firestore = FirebaseFirestore.instance.collection("WildfireUpdates");

Auth auth = Auth();
User? user = FirebaseAuth.instance.currentUser;

class _MenuScreenState extends State<MenuScreen> {


  int _currentSelected = 1;
  late Widget currentPage;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    bottomPages = [
      DashboardScreen(
        viewAllUpdatesTap: () {
          _onItemTapped(3);
        },
        askAnythingTap: () {
          _onItemTapped(4);
        },
        imAliveTap: () {
          _onItemTapped(2);
        },
      ),
      DashboardScreen(
        viewAllUpdatesTap: () {
          _onItemTapped(3);
        },
        askAnythingTap: () {
          _onItemTapped(4);
        },
        imAliveTap: () {
          _onItemTapped(2);
        },
      ),
      AliveScreen(),
      UpdatesScreen(),
      AskScreen(),
    ];
  }

  void onItemTapped(int index) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (index == 0) {
        _drawerKey.currentState?.openDrawer();
      } else if (index == 1) {
        setState(() {
          _currentSelected = index;
        });
      } else if (index == 3) {
        setState(() {
          _currentSelected = index;
        });
      } else if ((index == 2) & (user != null)) {
        setState(() {
          _currentSelected = index;
        });
      } else if ((index == 4) & (user != null)) {
        setState(() {
          _currentSelected = index;
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => LoginPopup(
              askAnythingTap: () {
                _onItemTapped(index);
              },
            ),
          ),
        );
      }
    });
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      _drawerKey.currentState?.openDrawer();
    }
else if (index == 2 || index == 4){
      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user != null) {
          setState(() {
            _currentSelected = index;
          });
        } else
        {
          popupforlogins();
        }

      })
          ;}
else
    setState(() {
      _currentSelected = index;
    });
  }

  List<Widget> bottomPages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      body: bottomPages.elementAt(
        _currentSelected,
      ),
      drawer: Drawer(
          child: Container(
        height: 896.h,
        width: 309.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 79.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 29.w),
              child: Text(
                "Menu",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
              ),
            ),
            SizedBox(
              height: 34.h,
            ),
            Divider(
              height: 1,
              color: Color.fromRGBO(230, 235, 248, 1),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 11.w,
              ),
              child: Container(
                height: 45.h,
                child: TextButton(
                  onPressed: () {
                    FirebaseAuth.instance
                        .authStateChanges()
                        .listen((User? user) {
                      if (user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      }
                    });
                  },
                  child: Text(
                    "Profile",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Color.fromRGBO(230, 235, 248, 1),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10.w,
              ),
              child: Container(
                height: 45.h,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InboxScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Inbox",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Color.fromRGBO(230, 235, 248, 1),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 17.w,
              ),
              child: Container(
                height: 45.h,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Settings",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Color.fromRGBO(230, 235, 248, 1),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 7.w,
              ),
              child: Container(
                height: 45.h,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FaqScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "FAQ",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Color.fromRGBO(230, 235, 248, 1),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16.w,
              ),
              child: Container(
                height: 45.h,
                child: TextButton(
                  onPressed: () async {
                    await auth.signOut().then((onSuccess) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/", (route) => false);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text("Logged Out!"),
                        ),
                      );
                    });
                  },
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Color.fromRGBO(8, 146, 133, 1)),
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Color.fromRGBO(230, 235, 248, 1),
            ),
            Padding(
              padding: EdgeInsets.only(top: 358.h, left: 16.w),
              child: Container(
                height: 45.h,
                width: 277.w,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop((route) => route.isFirst);
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp,
                        color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    backgroundColor: Color.fromRGBO(255, 98, 77, 1),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(249, 249, 249, 0.94),
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
            TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
        selectedItemColor: Color.fromRGBO(255, 98, 77, 1),
        unselectedLabelStyle:
            TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
        unselectedItemColor: Color.fromRGBO(195, 199, 210, 1),
        currentIndex: _currentSelected,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: SvgPicture.asset(
                "assets/icons/menu.svg",
                height: 24.h,
                width: 24.w,
                color: _currentSelected == 0
                    ? Color.fromRGBO(255, 98, 77, 1)
                    : Color.fromRGBO(195, 199, 210, 1),
              ),
            ),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: SvgPicture.asset("assets/icons/home.svg",
                  height: 24.h,
                  width: 24.w,
                  color: _currentSelected == 1
                      ? Color.fromRGBO(255, 98, 77, 1)
                      : Color.fromRGBO(195, 199, 210, 1)),
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: SvgPicture.asset("assets/icons/tiny-thumbs-up.svg",
                    height: 24.h,
                    width: 24.w,
                    color: _currentSelected == 2
                        ? Color.fromRGBO(255, 98, 77, 1)
                        : Color.fromRGBO(195, 199, 210, 1)),
              ),
              label: "Im Alive"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: SvgPicture.asset("assets/icons/tiny-bell.svg",
                    height: 24.h,
                    width: 24.w,
                    color: _currentSelected == 3
                        ? Color.fromRGBO(255, 98, 77, 1)
                        : Color.fromRGBO(195, 199, 210, 1)),
              ),
              label: "Updates"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: SvgPicture.asset("assets/icons/tiny-help-circle.svg",
                    height: 24.h,
                    width: 24.w,
                    color: _currentSelected == 4
                        ? Color.fromRGBO(255, 98, 77, 1)
                        : Color.fromRGBO(195, 199, 210, 1)),
              ),
              label: "Ask"),
        ],
      ),
    );
  }

  void popupforlogins(){
    showDialog(context: context, builder: (BuildContext context){
      return Dialog(

          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(
                  16.r)),
          child: Container(
            height: 381.h,
            width: 358.w,
            decoration: BoxDecoration(
                color: Color.fromRGBO(
                    249, 249, 249, 1),
                borderRadius:
                BorderRadius.all(
                    Radius.circular(
                        16.r))),
            child: Padding(
              padding:
              EdgeInsets.symmetric(
                  horizontal: 7.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  SvgPicture.asset(
                    "assets/icons/firelogo.svg",
                    height: 21.h,
                    width: 46.w,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    "WILDFIRE",
                    style: TextStyle(
                        fontWeight:
                        FontWeight
                            .w800,
                        fontSize: 18.sp,
                        color: Colors
                            .black),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Form(
                    key: lformKey,
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        Text(
                          "Email",
                          style:
                          TextStyle(
                            fontSize:
                            13.sp,
                            fontWeight:
                            FontWeight
                                .w700,
                            color: Colors
                                .black,
                          ),
                          textAlign:
                          TextAlign
                              .left,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          height: 40.h,
                          width: 343.w,
                          child: Column(
                            children: [
                              Expanded(
                                child:
                                TextFormField(
                                  validator:
                                      (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email address';
                                    }
                                    return null;
                                  },
                                  style:
                                  TextStyle(fontSize: 13.sp),
                                  controller:
                                  lemailController,
                                  keyboardType:
                                  TextInputType.emailAddress,
                                  textInputAction:
                                  TextInputAction.next,
                                  focusNode:
                                  lemailFocus,
                                  onFieldSubmitted:
                                      (value) {
                                    _fieldFocusChange(
                                        context,
                                        lemailFocus,
                                        lpasswordFocus);
                                  },
                                  textAlignVertical:
                                  TextAlignVertical.center,
                                  decoration:
                                  InputDecoration(
                                    errorStyle: TextStyle(
                                        fontSize: 10.sp,
                                        height: 0.15.h,
                                        color: Color.fromRGBO(139, 0, 0, 1)),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 5.h),
                                    border:
                                    OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(195, 199, 210, 1),
                                          width: 1.5),
                                    ),
                                    enabledBorder:
                                    OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(195, 199, 210, 1),
                                          width: 1.5),
                                    ),
                                    errorBorder:
                                    OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(139, 0, 0, 1),
                                          width: 1),
                                    ),
                                    focusedErrorBorder:
                                    OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(139, 0, 0, 1),
                                          width: 0),
                                    ),
                                    filled:
                                    true,
                                    fillColor:
                                    Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          "Password",
                          style:
                          TextStyle(
                            fontSize:
                            13.sp,
                            fontWeight:
                            FontWeight
                                .w700,
                            color: Colors
                                .black,
                          ),
                          textAlign:
                          TextAlign
                              .left,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          height: 40.h,
                          width: 343.w,
                          child: Column(
                            children: [
                              Expanded(
                                child:
                                TextFormField(
                                  validator:
                                      (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                  style:
                                  TextStyle(fontSize: 13.sp),
                                  obscureText:
                                  true,
                                  controller:
                                  lpasswordController,
                                  textInputAction:
                                  TextInputAction.done,
                                  focusNode:
                                  lpasswordFocus,
                                  onFieldSubmitted:
                                      (value) {
                                    lpasswordFocus.unfocus();
                                  },
                                  textAlignVertical:
                                  TextAlignVertical.center,
                                  decoration:
                                  InputDecoration(
                                    errorStyle: TextStyle(
                                        fontSize: 10.sp,
                                        height: 0.15.h,
                                        color: Color.fromRGBO(139, 0, 0, 1)),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 5.h),
                                    border:
                                    OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(195, 199, 210, 1),
                                          width: 1.5),
                                    ),
                                    enabledBorder:
                                    OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(195, 199, 210, 1),
                                          width: 1.5),
                                    ),
                                    errorBorder:
                                    OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(139, 0, 0, 1),
                                          width: 1),
                                    ),
                                    focusedErrorBorder:
                                    OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(139, 0, 0, 1),
                                          width: 0),
                                    ),
                                    filled:
                                    true,
                                    fillColor:
                                    Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        Container(
                          width: 343.w,
                          height: 40.h,
                          decoration:
                          BoxDecoration(
                            color: Color
                                .fromRGBO(
                                255,
                                98,
                                77,
                                1),
                            borderRadius:
                            BorderRadius.circular(
                                4.r),
                          ),
                          child:
                          TextButton(
                            onPressed:
                                () async {
                              if (lformKey
                                  .currentState!
                                  .validate()) {
                                await auth
                                    .logIn(
                                    email: lemailController.text,
                                    password: lpasswordController.text)
                                    .then((onSuccess) {
                                  lemailController
                                      .clear();
                                  lpasswordController
                                      .clear();
                                  Navigator.pop(
                                      context,
                                    {
                                    _onItemTapped(4)
                                    },);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text("Login Successful!"),
                                    ),
                                  );
                                }).catchError((e) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(e.toString()),
                                    ),
                                  );
                                });
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 13
                                      .sp,
                                  fontWeight: FontWeight
                                      .w700,
                                  color:
                                  Colors.white),
                              textAlign:
                              TextAlign
                                  .center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 40.h,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceEvenly,
                      children: [
                        TextButton(
                            onPressed:
                                () {
                              lemailController
                                  .clear();
                              lpasswordController
                                  .clear();
                            },
                            child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color:
                                    Colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700))),
                        VerticalDivider(
                            thickness:
                            1.w,
                            color: Colors
                                .black),
                        TextButton(
                            onPressed:
                                () {
                              showDialog(
                                context:
                                context,
                                builder:
                                    (BuildContext
                                context) {
                                  return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              16.r)),
                                      child: Container(
                                        height: 496.h,
                                        width: 358.w,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                249, 249, 249, 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16.r))),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7.w),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 24.h,
                                              ),
                                              Text(
                                                "Sign Up",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 18.sp,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Form(
                                                key: formKey,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      "First Name",
                                                      style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontWeight: FontWeight
                                                            .w700,
                                                        color: Colors.black,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    Container(
                                                      height: 40.h,
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                            child: TextFormField(
                                                              validator: (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return 'Please enter your first name';
                                                                }
                                                                return null;
                                                              },
                                                              style: TextStyle(
                                                                  fontSize: 13
                                                                      .sp),
                                                              controller: firstNameController,
                                                              textInputAction: TextInputAction
                                                                  .next,
                                                              focusNode: firstNameFocus,
                                                              onFieldSubmitted: (
                                                                  value) {
                                                                _fieldFocusChange(
                                                                    context,
                                                                    firstNameFocus,
                                                                    lastNameFocus);
                                                              },
                                                              textAlignVertical: TextAlignVertical
                                                                  .center,
                                                              decoration: InputDecoration(
                                                                errorStyle: TextStyle(
                                                                    fontSize: 10
                                                                        .sp,
                                                                    height: 0.15
                                                                        .h,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                        139, 0, 0,
                                                                        1)),
                                                                contentPadding: EdgeInsets
                                                                    .symmetric(
                                                                    horizontal: 10
                                                                        .w,
                                                                    vertical: 5
                                                                        .h),
                                                                border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      4.r),
                                                                  borderSide: BorderSide(
                                                                      color: Color
                                                                          .fromRGBO(
                                                                          195,
                                                                          199,
                                                                          210, 1),
                                                                      width: 1.5),
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      4.r),
                                                                  borderSide: BorderSide(
                                                                      color: Color
                                                                          .fromRGBO(
                                                                          195,
                                                                          199,
                                                                          210, 1),
                                                                      width: 1.5),
                                                                ),
                                                                errorBorder: OutlineInputBorder(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      4.r),
                                                                  borderSide: BorderSide(
                                                                      color: Color
                                                                          .fromRGBO(
                                                                          139, 0,
                                                                          0, 1),
                                                                      width: 1),
                                                                ),
                                                                focusedErrorBorder: OutlineInputBorder(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      4.r),
                                                                  borderSide: BorderSide(
                                                                      color: Color
                                                                          .fromRGBO(
                                                                          139, 0,
                                                                          0, 1),
                                                                      width: 0),
                                                                ),
                                                                filled: true,
                                                                fillColor: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Text(
                                                      "Last Name",
                                                      style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontWeight: FontWeight
                                                            .w700,
                                                        color: Colors.black,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    Container(
                                                      height: 40.h,
                                                      child: TextFormField(
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please enter your last name';
                                                          }
                                                          return null;
                                                        },
                                                        style: TextStyle(
                                                            fontSize: 13.sp),
                                                        textInputAction: TextInputAction
                                                            .next,
                                                        focusNode: lastNameFocus,
                                                        onFieldSubmitted: (
                                                            value) {
                                                          _fieldFocusChange(
                                                              context,
                                                              lastNameFocus,
                                                              phoneNumberFocus);
                                                        },
                                                        controller: lastNameController,
                                                        textAlignVertical: TextAlignVertical
                                                            .center,
                                                        decoration: InputDecoration(
                                                          errorStyle: TextStyle(
                                                              fontSize: 10.sp,
                                                              height: 0.15.h,
                                                              color: Color
                                                                  .fromRGBO(
                                                                  139, 0, 0, 1)),
                                                          contentPadding: EdgeInsets
                                                              .symmetric(
                                                              horizontal: 10.w,
                                                              vertical: 5.h),
                                                          border: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    195, 199, 210,
                                                                    1),
                                                                width: 1.5),
                                                          ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    195, 199, 210,
                                                                    1),
                                                                width: 1.5),
                                                          ),
                                                          errorBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    139, 0, 0, 1),
                                                                width: 1),
                                                          ),
                                                          focusedErrorBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    139, 0, 0, 1),
                                                                width: 0),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Text(
                                                      "Phone Number",
                                                      style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontWeight: FontWeight
                                                            .w700,
                                                        color: Colors.black,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    Container(
                                                      height: 40.h,
                                                      child: TextFormField(
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please enter your phone number';
                                                          } else
                                                          if (value.length > 10 ||
                                                              value.length < 10) {
                                                            return 'Please enter your 10-digit phone number';
                                                          }
                                                          return null;
                                                        },
                                                        style: TextStyle(
                                                            fontSize: 13.sp),
                                                        keyboardType: TextInputType
                                                            .number,
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                        textInputAction: TextInputAction
                                                            .next,
                                                        focusNode: phoneNumberFocus,
                                                        onFieldSubmitted: (
                                                            value) {
                                                          _fieldFocusChange(
                                                              context,
                                                              phoneNumberFocus,
                                                              emailFocus);
                                                        },
                                                        controller: phoneNumberController,
                                                        textAlignVertical: TextAlignVertical
                                                            .center,
                                                        decoration: InputDecoration(
                                                          errorStyle: TextStyle(
                                                              fontSize: 10.sp,
                                                              height: 0.15.h,
                                                              color: Color
                                                                  .fromRGBO(
                                                                  139, 0, 0, 1)),
                                                          contentPadding: EdgeInsets
                                                              .symmetric(
                                                              horizontal: 10.w,
                                                              vertical: 5.h),
                                                          border: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    195, 199, 210,
                                                                    1),
                                                                width: 1.5),
                                                          ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    195, 199, 210,
                                                                    1),
                                                                width: 1.5),
                                                          ),
                                                          errorBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    139, 0, 0, 1),
                                                                width: 1),
                                                          ),
                                                          focusedErrorBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    139, 0, 0, 1),
                                                                width: 0),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Text(
                                                      "Email",
                                                      style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontWeight: FontWeight
                                                            .w700,
                                                        color: Colors.black,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    Container(
                                                      height: 40.h,
                                                      child: TextFormField(
                                                        validator: emailValidator,
                                                        style: TextStyle(
                                                            fontSize: 13.sp),
                                                        keyboardType: TextInputType
                                                            .emailAddress,
                                                        textInputAction: TextInputAction
                                                            .next,
                                                        focusNode: emailFocus,
                                                        onFieldSubmitted: (
                                                            value) {
                                                          _fieldFocusChange(
                                                              context, emailFocus,
                                                              passwordFocus);
                                                        },
                                                        controller: emailController,
                                                        textAlignVertical: TextAlignVertical
                                                            .center,
                                                        decoration: InputDecoration(
                                                          errorStyle: TextStyle(
                                                              fontSize: 10.sp,
                                                              height: 0.15.h,
                                                              color: Color
                                                                  .fromRGBO(
                                                                  139, 0, 0, 1)),
                                                          contentPadding: EdgeInsets
                                                              .symmetric(
                                                              horizontal: 10.w,
                                                              vertical: 5.h),
                                                          border: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    195, 199, 210,
                                                                    1),
                                                                width: 1.5),
                                                          ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    195, 199, 210,
                                                                    1),
                                                                width: 1.5),
                                                          ),
                                                          errorBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    139, 0, 0, 1),
                                                                width: 1),
                                                          ),
                                                          focusedErrorBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    139, 0, 0, 1),
                                                                width: 0),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Text(
                                                      "Password",
                                                      style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontWeight: FontWeight
                                                            .w700,
                                                        color: Colors.black,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    Container(
                                                      height: 40.h,
                                                      child: TextFormField(
                                                        validator: passwordValidator,
                                                        style: TextStyle(
                                                            fontSize: 13.sp),
                                                        obscureText: true,
                                                        textInputAction: TextInputAction
                                                            .done,
                                                        focusNode: passwordFocus,
                                                        onFieldSubmitted: (
                                                            value) {
                                                          passwordFocus.unfocus();
                                                        },
                                                        controller: passwordController,
                                                        textAlignVertical: TextAlignVertical
                                                            .top,
                                                        decoration: InputDecoration(
                                                          errorStyle: TextStyle(
                                                              fontSize: 10.sp,
                                                              height: 0.15.h,
                                                              color: Color
                                                                  .fromRGBO(
                                                                  139, 0, 0, 1)),
                                                          contentPadding: EdgeInsets
                                                              .symmetric(
                                                              vertical: 15.h,
                                                              horizontal: 10.w),
                                                          border: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    195, 199, 210,
                                                                    1),
                                                                width: 1.5),
                                                          ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    195, 199, 210,
                                                                    1),
                                                                width: 1.5),
                                                          ),
                                                          errorBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    139, 0, 0, 1),
                                                                width: 1),
                                                          ),
                                                          focusedErrorBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(4.r),
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    139, 0, 0, 1),
                                                                width: 0),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),
                                                    Container(
                                                      height: 40.h,
                                                      width: 343.w,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            255, 98, 77, 1),
                                                        borderRadius: BorderRadius
                                                            .circular(4.r),
                                                      ),
                                                      child: TextButton(
                                                        onPressed: () async {
                                                          if (formKey
                                                              .currentState!
                                                              .validate()) {
                                                            await auth.signUp(
                                                                email: emailController
                                                                    .text,
                                                                password: passwordController
                                                                    .text).then((
                                                                onSuccess) {
                                                              CollectionReference UserUpdate = FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                  "UserUpdate");
                                                              UserUpdate.add({
                                                                "firstName": firstNameController
                                                                    .text,
                                                                "lastName": lastNameController
                                                                    .text,
                                                                "phoneNumber": phoneNumberController
                                                                    .text,
                                                                "email": emailController
                                                                    .text,
                                                              });
                                                              emailController
                                                                  .clear();
                                                              passwordController
                                                                  .clear();
                                                              firstNameController
                                                                  .clear();
                                                              lastNameController
                                                                  .clear();
                                                              phoneNumberController
                                                                  .clear();
                                                              Navigator.pop(
                                                                  context, {_onItemTapped(4)});
                                                              Navigator.pop(
                                                                  context, {_onItemTapped(4)});
                                                              ScaffoldMessenger
                                                                  .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  duration: Duration(
                                                                      seconds: 1),
                                                                  content: Text(
                                                                      "Registration Successful!"),
                                                                ),
                                                              );
                                                            }).catchError((e) {
                                                              ScaffoldMessenger
                                                                  .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(e
                                                                      .toString()),
                                                                ),
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Text(
                                                          "Sign Up",
                                                          style: TextStyle(
                                                              fontSize: 13.sp,
                                                              fontWeight: FontWeight
                                                                  .w700,
                                                              color: Colors
                                                                  .white),
                                                          textAlign: TextAlign
                                                              .center,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7.h,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius
                                                      .circular(4.r),
                                                ),
                                                width: 343.w,
                                                height: 40.h,
                                                child: OutlinedButton(
                                                  onPressed: () {
                                                    emailController.clear();
                                                    passwordController.clear();
                                                    firstNameController.clear();
                                                    lastNameController.clear();
                                                    phoneNumberController.clear();
                                                    Navigator.of(context)
                                                        .popUntil((route) =>
                                                    route.isFirst);
                                                  },
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontWeight: FontWeight
                                                            .w700,
                                                        color: Color.fromRGBO(
                                                            255, 98, 76, 1)),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  style: OutlinedButton.styleFrom(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(4.r)),
                                                      primary: Colors.white,
                                                      side: BorderSide(width: 1.w,
                                                          color: Color.fromRGBO(
                                                              255, 98, 76, 1))),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                              );
                              emailController
                                  .clear();
                              passwordController
                                  .clear();
                              firstNameController
                                  .clear();
                              lastNameController
                                  .clear();
                              phoneNumberController
                                  .clear();
                              lemailController
                                  .clear();
                              lpasswordController
                                  .clear();
                            },
                            child: Text(
                                "Create an Account",
                                style: TextStyle(
                                    color:
                                    Colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

}


