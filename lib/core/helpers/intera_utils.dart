import 'package:brasil_fields/brasil_fields.dart';

class InteraUtils {
  InteraUtils._();

  static final RegExp _emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static bool isValidEmail(String value) => _emailRegex.hasMatch(value);
  static bool isValidCPF(String value) => UtilBrasilFields.isCPFValido(value);
  static bool isValidCNPJ(String value) => UtilBrasilFields.isCNPJValido(value);

  static String generateCPF({bool useFormat = false}) => UtilBrasilFields.gerarCPF(useFormat: useFormat);
  static String generateCNPJ({bool useFormat = false}) => UtilBrasilFields.gerarCNPJ(useFormat: useFormat);
}
