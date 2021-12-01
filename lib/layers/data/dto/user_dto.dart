import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/entities/UserEntity.dart';

class UserDto extends UserEntity {
  UserDto({
    required this.id,
    this.email,
    this.name,
    this.phoneNumber,
    this.photoURL,
  }) : super(
          id: id,
          email: email,
          name: name,
          phoneNumber: phoneNumber,
          photoURL: photoURL,
        );

  final String id;
  final String? email;
  final String? name;
  final String? phoneNumber;
  final String? photoURL;

  factory UserDto.fromFirebaseUser(UserCredential credentials) {
    if (credentials.user == null) throw Exception('User not fount');

    return UserDto(
      id: credentials.user!.uid,
      email: credentials.user!.email,
      name: credentials.user!.displayName,
      phoneNumber: credentials.user!.phoneNumber,
      photoURL: credentials.user!.photoURL,
    );
  }

  factory UserDto.fromGoogleUser(GoogleSignInAccount credentials) {
    return UserDto(
      id: credentials.id,
      email: credentials.email,
      name: credentials.displayName,
      photoURL: credentials.photoUrl,
    );
  }

  factory UserDto.fromMap(Map<String, dynamic> map) => UserDto(
        id: map['id'],
        email: map['email'],
        name: map['name'],
        phoneNumber: map['phone_number'],
        photoURL: map['photo_url'],
      );

  factory UserDto.fromJson(String json) {
    final Map<String, dynamic> map = jsonDecode(json);
    
    return UserDto(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      phoneNumber: map['phone_number'],
      photoURL: map['photo_url'],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "name": name,
        "phone_number": phoneNumber,
        "photo_url": photoURL,
      };

  String toJson() => jsonEncode(toMap());
}
