import 'package:get/get.dart';
import 'package:intera/layers/data/datasources/authentication/authentication_datasource.dart';
import 'package:intera/layers/data/datasources/authentication/firebase/firebase_authentication_datasource.dart';
import 'package:intera/layers/data/repositories/authentication/authentication_repository_imp.dart';
import 'package:intera/layers/domain/repositories/authentication/authentication_repository.dart';
import 'package:intera/layers/domain/usecases/authentication/authenticate_with_email_and_password_usecase.dart';
import 'package:intera/layers/domain/usecases/authentication/authenticate_with_email_and_password_usecase_imp.dart';

import 'controllers/login_controller.dart';

class LoginIoC extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationDatasource>(() => FirebaseAuthenticationDatasource(Get.find()));
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepositoryImp(Get.find()));
    Get.lazyPut<AuthenticateWithEmailAndPasswordUseCase>(() => AuthenticateWithEmailAndPasswordUseCaseImp(Get.find()));

    Get.lazyPut(() => LoginController(Get.find()));
  }
}
