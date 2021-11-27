import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart' as responsive;

import '../controllers/login_controller.dart';
import '../../../../../core/theme/intera_colors.dart';
import '../../../../../core/components/app_bar.dart';
import '../../../../../core/components/button.dart';
import '../../../../../core/components/text_form_field.dart';
import '../../../../../core/helpers/intera_page.dart';
import '../../../../../core/helpers/intera_utils.dart';

class LoginPage extends InteraPage<LoginController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InteraColors.baseLight100,
      appBar: InteraAppBar(
        title: 'Login',
        height: responsive.ResponsiveWrapper.of(context).isSmallerThan(responsive.MOBILE) ? 60 : 70,
        fontSize: responsive.ResponsiveWrapper.of(context).isSmallerThan(responsive.MOBILE) ? 18 : 20,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            right: 20,
            left: 20,
            top: responsive.ResponsiveWrapper.of(context).isSmallerThan(responsive.MOBILE) ? 30 : 50,
            bottom: MediaQuery.of(context).padding.bottom + 20,
          ),
          child: Obx(
            () => Form(
              key: _formKey,
              child: Column(
                children: [
                  FadeInUp(
                    from: 20,
                    duration: Duration(milliseconds: 500),
                    child: InteraTextField(
                      hint: 'ex: intera@email.com',
                      label: 'E-mail*',
                      initialValue: controller.email,
                      onChanged: (email) => controller.email = email,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Por favor, digite seu e-mail';

                        if (InteraUtils.isValidEmail(value) == false) return 'Digite um e-mail válido';

                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  FadeInUp(
                    from: 20,
                    duration: Duration(milliseconds: 500),
                    delay: Duration(milliseconds: 500),
                    child: InteraTextField(
                      label: 'Senha*',
                      hint: '**********',
                      initialValue: controller.password,
                      onChanged: (password) => controller.password = password,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscure: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Por favor, digite sua senha';

                        if (value.length < 6) return 'A senha deve ter pelo menos 6 caracteres';

                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: responsive.ResponsiveWrapper.of(context).isSmallerThan(responsive.MOBILE) ? 20 : 40),
                  FadeInUp(
                    from: 20,
                    duration: Duration(milliseconds: 500),
                    delay: Duration(milliseconds: 600),
                    child: InteraButton.primary(
                      'Entrar',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.authenticate();
                        }
                      },
                      loading: loading,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
