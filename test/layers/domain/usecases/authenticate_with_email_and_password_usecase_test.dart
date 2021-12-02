import 'package:faker/faker.dart';
import 'package:intera/core/enums/auth_type.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:intera/layers/data/dto/user_dto.dart';
import 'package:intera/layers/domain/entities/UserEntity.dart';
import 'package:intera/layers/domain/entities/CredentialsEntity.dart';
import 'package:intera/layers/data/datasources/authentication/authentication_datasource.dart';
import 'package:intera/layers/data/repositories/authentication/authentication_repository_imp.dart';
import 'package:intera/layers/domain/repositories/authentication/authentication_repository.dart';
import 'package:intera/layers/domain/usecases/authentication/authenticate_with_email_and_password_usecase.dart';
import 'package:intera/layers/domain/usecases/authentication/authenticate_with_email_and_password_usecase_imp.dart';
import 'authenticate_with_email_and_password_usecase_test.mocks.dart';

@GenerateMocks([AuthenticationDatasource])
main() {
  late AuthenticationDatasource datasource;
  late AuthenticationRepository repository;
  late AuthenticateWithEmailAndPasswordUseCase sut;

  setUpAll(() {
    datasource = MockAuthenticationDatasource();
    repository = AuthenticationRepositoryImp(datasource);
    sut = AuthenticateWithEmailAndPasswordUseCaseImp(repository);
  });

  final UserDto _generatedUser = UserDto(
    id: faker.guid.guid(),
    email: faker.internet.email(),
    name: faker.person.name(),
    phoneNumber: faker.phoneNumber.us(),
    photoURL: faker.internet.httpUrl(),
    authType: AuthType.EmailAndPassword,
  );

  test('Should throws Exception where invalid credentials', () async {
    var credentials = CredentialsEntity(email: 'invalidemail', password: '123');

    expect(() async => await sut.call(credentials), throwsA(isA<Exception>()));

    credentials = CredentialsEntity(email: 'invalidemail', password: '1234567');

    expect(() async => await sut.call(credentials), throwsA(isA<Exception>()));
  });

  test('Should return UserDto where valid credentials', () async {
    var credentials = CredentialsEntity(email: _generatedUser.email!, password: '123456');

    when(datasource.authenticateWithEmailAndPassword(credentials)).thenAnswer((_) async => _generatedUser);

    var user = await sut.call(credentials);

    expect(user, isA<UserEntity>());
    expect(user.id, _generatedUser.id);
    expect(user.name, _generatedUser.name);
    expect(user.email, _generatedUser.email);
    expect(user.phoneNumber, _generatedUser.phoneNumber);
    expect(user.photoURL, _generatedUser.photoURL);
  });
}
