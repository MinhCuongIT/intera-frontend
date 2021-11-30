class CredentialsEntity {
  CredentialsEntity({
    required this.email,
    required this.password,
  })  : assert(email.isNotEmpty),
        assert(password.isNotEmpty);

  final String email;
  final String password;

  bool get isValid => email.isNotEmpty && password.isNotEmpty;
}
