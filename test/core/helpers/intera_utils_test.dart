import 'package:faker/faker.dart';
import 'package:test/test.dart';

import 'package:intera/core/helpers/intera_utils.dart';

void main() {
  String stringToValidate = '';

  test('Should return true if the email is correct', () {
    stringToValidate = faker.internet.email();

    expect(InteraUtils.isValidEmail(stringToValidate), true);
  });

  test('Should return false if the email is incorrect', () {
    stringToValidate = 'teste.com.br';

    expect(InteraUtils.isValidEmail(stringToValidate), false);
  });

  test('Should return true if the CPF is correct', () {
    stringToValidate = InteraUtils.generateCPF();

    expect(InteraUtils.isValidCPF(stringToValidate), true);

    stringToValidate = InteraUtils.generateCPF(useFormat: true);

    expect(InteraUtils.isValidCPF(stringToValidate), true);
  });

  test('Should return false if the CPF is incorrect', () {
    stringToValidate = '000.2000.000-200';

    expect(InteraUtils.isValidCPF(stringToValidate), false);

    stringToValidate = 'sda.dsa.asd-ds';

    expect(InteraUtils.isValidCPF(stringToValidate), false);

    stringToValidate = 'sdewrfgvcxd';

    expect(InteraUtils.isValidCPF(stringToValidate), false);
  });

  test('Should return true if the CNPJ is correct', () {
    stringToValidate = InteraUtils.generateCPF();

    expect(InteraUtils.isValidCPF(stringToValidate), true);

    stringToValidate = InteraUtils.generateCPF(useFormat: true);

    expect(InteraUtils.isValidCPF(stringToValidate), true);
  });

  test('Should return false if the CNPJ is incorrect', () {
    stringToValidate = '000.2000.000-200';

    expect(InteraUtils.isValidCNPJ(stringToValidate), false);

    stringToValidate = 'sda.dsa.asd-ds';

    expect(InteraUtils.isValidCNPJ(stringToValidate), false);

    stringToValidate = 'sdewrfgvcxd';

    expect(InteraUtils.isValidCNPJ(stringToValidate), false);
  });
}
