// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:wildfire1/model/user_model.dart';
//
// import 'dashboard/dashboard.dart';
//
// class AuthenticationService {
//   // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   //
//   // Future<bool> isUserLoggedIn() async {
//   //   var user = await _firebaseAuth.currentUser!();
//   //   return user != null;
//   // }
// }
//
// class ProfileScreen extends StatefulWidget {
//   final User user;
//   const ProfileScreen({required this.user});
//
//
//
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }
//
// var firestore = FirebaseFirestore.instance.collection("UserUpdate");
// User? user = FirebaseAuth.instance.currentUser;
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   bool _isSendingVerification = false;
//   bool _isSigningOut = false;
//   late User _currentUser;
//
//   @override
//   void initState() {
//     _currentUser = widget.user;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(
//       leading: Padding(
//         padding: EdgeInsets.only(top: 22.h),
//         child: BackButton( color: Colors.black ),
//       ),
//       elevation: 0,
//       toolbarHeight: 79.h,
//       title: Padding(
//         padding: EdgeInsets.only(top: 25.h, right: 16.w),
//         child: Text(
//           "Profile",
//           style: TextStyle(
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w700,
//               color: Colors.black),
//         ),
//       ),
//       backgroundColor: Colors.white,
//     ),
//         backgroundColor: Color.fromRGBO(8, 146, 133, 1),
//         body:Padding(
//           padding: EdgeInsets.symmetric(horizontal: 50.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircleAvatar(),
//               Text("Name"),
//               Text(UserUpdate.firstName),
//               Text("Phone Number"),
//               Text(UserUpdate.data['phoneNumber'].toString()),
//               Text("Email Address"),
//               Text('${_currentUser!.email}')
//             ],
//           ),
//         )
//     );
//   }
//
//
//
// }
