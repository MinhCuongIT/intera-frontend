class UserEntity {
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
}
