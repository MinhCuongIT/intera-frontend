import 'package:get/get.dart';
import 'controller.dart';

abstract class InteraPage<TController extends InteraController> extends GetView<TController> {
  bool get loading => controller.loading;
}