import 'package:get/get.dart';
import 'package:intera/core/helpers/controller.dart';

abstract class InteraPage<TController extends InteraController> extends GetView<TController> {
  bool get loading => controller.loading;
}