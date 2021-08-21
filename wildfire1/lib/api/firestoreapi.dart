// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:wildfire1/model/user_model.dart';
// import 'package:wildfire1/ui/views/dashboard/dashboard.dart';
//
// class FirestoreApi{
//   final log = getLogger("FirestoreApi");
//   final CollectionReference usersCollection;
//   FirebaseFirestore.instance.collect("UserUpdate");
//   Future<void> createUser((required User user)) async{
//     log.i("user:$user");
//     try{
//       final userDocument = usersCollection.doc(user.id);
//       await userDocument.set(user.toJson());
//       log.v("UserCreated at $(userDocument.path)");
//   }
// }
// }