import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/enums/auth_type.dart';
import '../../domain/entities/UserEntity.dart';

class UserDto extends UserEntity {
  UserDto({
    required this.id,
    required this.authType,
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
          authType: authType,
        );

  final String id;
  final String? email;
  final String? name;
  final String? phoneNumber;
  final String? photoURL;
  final AuthType authType;

  factory UserDto.fromFirebaseUser(UserCredential credentials, {required AuthType authType}) {
    if (credentials.user == null) throw Exception('User not fount');

    return UserDto(
      id: credentials.user!.uid,
      email: credentials.user!.email,
      name: credentials.user!.displayName,
      phoneNumber: credentials.user!.phoneNumber,
      photoURL: credentials.user!.photoURL,
      authType: authType,
    );
  }

  factory UserDto.fromMap(Map<String, dynamic> map) => UserDto(
        id: map['id'],
        email: map['email'],
        name: map['name'],
        phoneNumber: map['phone_number'],
        photoURL: map['photo_url'],
        authType: (map['auth_type'] as int).convertToAuthType,
      );

  factory UserDto.fromJson(String json) => UserDto.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "name": name,
        "phone_number": phoneNumber,
        "photo_url": photoURL,
        "auth_type": authType.toIndex,
      };

  String toJson() => jsonEncode(toMap());

  UserEntity toEntity() => UserEntity(
        id: id,
        email: email,
        name: name,
        phoneNumber: phoneNumber,
        photoURL: photoURL,
        authType: authType,
      );
}
