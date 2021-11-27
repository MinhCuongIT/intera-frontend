import 'package:get/get.dart';

abstract class InteraController extends GetxController {
  final RxBool _loading = RxBool(false);
  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;
}
