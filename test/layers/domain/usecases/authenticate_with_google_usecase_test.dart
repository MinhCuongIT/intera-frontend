import 'package:faker/faker.dart';
import 'package:intera/core/enums/auth_type.dart';
import 'package:intera/layers/domain/usecases/authentication/authenticate_with_google_usecase_imp.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:intera/layers/data/dto/user_dto.dart';
import 'package:intera/layers/domain/entities/UserEntity.dart';
import 'package:intera/layers/data/datasources/authentication/authentication_datasource.dart';
import 'package:intera/layers/data/repositories/authentication/authentication_repository_imp.dart';
import 'package:intera/layers/domain/repositories/authentication/authentication_repository.dart';
import 'package:intera/layers/domain/usecases/authentication/authenticate_with_google_usecase.dart';
import 'authenticate_with_email_and_password_usecase_test.mocks.dart';

main() {
  late AuthenticationDatasource datasource;
  late AuthenticationRepository repository;
  late AuthenticateWithGoogleUseCase sut;

  setUpAll(() {
    datasource = MockAuthenticationDatasource();
    repository = AuthenticationRepositoryImp(datasource);
    sut = AuthenticateWithGoogleUseCaseImp(repository);
  });

  final UserDto _generatedUser = UserDto(
    id: faker.guid.guid(),
    email: faker.internet.email(),
    name: faker.person.name(),
    phoneNumber: faker.phoneNumber.us(),
    photoURL: faker.internet.httpUrl(),
    authType: AuthType.Google,
  );

  test('Should return UserDto where valid credentials', () async {
    when(datasource.authenticateWithGoogle()).thenAnswer((_) async => _generatedUser);

    var user = await sut.call();

    expect(user, isA<UserEntity>());
    expect(user.id, _generatedUser.id);
    expect(user.name, _generatedUser.name);
    expect(user.email, _generatedUser.email);
    expect(user.phoneNumber, _generatedUser.phoneNumber);
    expect(user.photoURL, _generatedUser.photoURL);
  });
}
