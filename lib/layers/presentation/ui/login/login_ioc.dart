import 'package:get/get.dart';

import '../../controllers/login/login_controller.dart';
import '../../../data/datasources/authentication/authentication_datasource.dart';
import '../../../data/datasources/authentication/firebase/firebase_authentication_datasource.dart';
import '../../../data/repositories/authentication/authentication_repository_imp.dart';
import '../../../domain/repositories/authentication/authentication_repository.dart';
import '../../../domain/usecases/authentication/authenticate_with_email_and_password_usecase.dart';
import '../../../domain/usecases/authentication/authenticate_with_email_and_password_usecase_imp.dart';

class LoginIoC extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationDatasource>(() => FirebaseAuthenticationDatasource(Get.find()));
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepositoryImp(Get.find()));
    Get.lazyPut<AuthenticateWithEmailAndPasswordUseCase>(() => AuthenticateWithEmailAndPasswordUseCaseImp(Get.find()));

    Get.lazyPut(() => LoginController(Get.find()));
  }
}
