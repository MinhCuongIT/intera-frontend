import 'package:equatable/equatable.dart';

import '../../../core/enums/auth_type.dart';

class UserEntity extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? photoURL;
    final AuthType authType;

  const UserEntity({
    required this.id,
    required this.authType,
    this.name,
    this.email,
    this.phoneNumber,
    this.photoURL,
  });

  @override
  List<Object?> get props => [id, name, email, phoneNumber, photoURL, authType];
}
