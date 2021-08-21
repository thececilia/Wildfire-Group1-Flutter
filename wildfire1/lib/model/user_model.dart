import 'package:cloud_firestore/cloud_firestore.dart';

class UserUpdate {
  String id;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;


  UserUpdate(
      {required this.id,
        required this.firstName,
        required this.lastName,
        required this.phoneNumber,
        required this.email,
        });

  factory UserUpdate.fromJson(DocumentSnapshot data) {
    return UserUpdate(
      id: data["id"],
        firstName: data['firstName'],
        lastName: data['lastName'],
        phoneNumber: data['phoneNumber'],
        email: data['email'],
        );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "email": email,

    };
  }
}
