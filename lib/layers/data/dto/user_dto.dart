import 'package:firebase_auth/firebase_auth.dart';
import 'package:intera/layers/domain/entities/UserEntity.dart';

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
}
