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
import 'package:wildfire1/ui/views/menuscreen.dart';


class LoginPopup extends StatefulWidget {
  LoginPopup(
      {
        required this.askAnythingTap,
        });

  Function askAnythingTap;

  @override
  _LoginPopupState createState() => _LoginPopupState();
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
User? user = FirebaseAuth.instance.currentUser;

class _LoginPopupState extends State<LoginPopup> {
  Auth auth = Auth();

  MenuScreen? menuScreen;

  @override
  Widget build(BuildContext context) {
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
                                    widget.askAnythingTap());
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
                                                                context, widget
                                                                .askAnythingTap());
                                                            Navigator.pop(
                                                                context, widget
                                                                .askAnythingTap());
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
  }}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}