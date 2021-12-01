import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? photoURL;

  const UserEntity({
    required this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.photoURL,
  });

  @override
  List<Object?> get props => [id, name, email, phoneNumber, photoURL];
}
