import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart' as responsive;

import '../../controllers/login/login_controller.dart';
import '../../../../core/theme/intera_font.dart';
import '../../../../core/components/icons/google_icon.dart';
import '../../../../core/theme/intera_colors.dart';
import '../../../../core/components/app_bar.dart';
import '../../../../core/components/button.dart';
import '../../../../core/components/text_form_field.dart';
import '../../../../core/helpers/intera_page.dart';
import '../../../../core/helpers/intera_utils.dart';
import '../../../../core/core_services.dart';

class LoginPage extends InteraPage<LoginController> {
  final _formKey = GlobalKey<FormState>();
  final bool isLogged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InteraColors.baseLight100,
      appBar: InteraAppBar.white(
        'Login',
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
                  if (isLogged == false) ...{
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
                  } else ...{
                    Container(
                      height: responsive.ResponsiveWrapper.of(context).isSmallerThan(responsive.MOBILE) ? 50 : 60,
                      decoration: BoxDecoration(
                        color: InteraColors.background,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: InteraColors.baseLight20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: responsive.ResponsiveWrapper.of(context).isSmallerThan(responsive.MOBILE) ? 15 : 20),
                      child: Row(
                        children: [
                          SizedBox(
                            height: responsive.ResponsiveWrapper.of(context).isSmallerThan(responsive.MOBILE) ? 35 : 40,
                            width: responsive.ResponsiveWrapper.of(context).isSmallerThan(responsive.MOBILE) ? 35 : 40,
                            child: CircleAvatar(
                              child: Text(
                                'B',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: InteraFont.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: responsive.ResponsiveWrapper.of(context).isSmallerThan(responsive.MOBILE) ? 180 : 280,
                                child: Text(
                                  'Bernardo Veras',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: InteraColors.baseDark75,
                                    fontWeight: InteraFont.medium,
                                    fontSize: responsive.ResponsiveWrapper.of(context).isSmallerThan(responsive.MOBILE) ? 14 : 16,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2),
                              Container(
                                width: responsive.ResponsiveWrapper.of(context).isSmallerThan(responsive.MOBILE) ? 180 : 280,
                                child: Text(
                                  'bernardo@vvssistemas.com.br',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: InteraColors.textGray,
                                    fontWeight: InteraFont.medium,
                                    fontSize: responsive.ResponsiveWrapper.of(context).isSmallerThan(responsive.MOBILE) ? 12 : 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  },
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var user = await controller.authenticateWithEmailAndPassword();

                          if (user != null) router.toHome(closeAll: true);
                        }
                      },
                      loading: loading,
                    ),
                  ),
                  SizedBox(height: responsive.ResponsiveWrapper.of(context).isSmallerThan(responsive.MOBILE) ? 10 : 20),
                  FadeInUp(
                    from: 20,
                    duration: Duration(milliseconds: 500),
                    delay: Duration(milliseconds: 600),
                    child: InteraButton.ghost(
                      'Entrar com Google',
                      onPressed: () async {
                        var user = await controller.authenticateWithGoogle();

                        if (user != null) router.toHome(closeAll: true);
                      },
                      icon: GoogleIcon(size: 30),
                      loading: loading,
                    ),
                  ),
                  SizedBox(height: responsive.ResponsiveWrapper.of(context).isSmallerThan(responsive.MOBILE) ? 20 : 40),
                  FadeInUp(
                    from: 20,
                    duration: Duration(milliseconds: 500),
                    delay: Duration(milliseconds: 600),
                    child: InteraButton(
                      'Esqueceu a senha?',
                      backgroundColor: Colors.transparent,
                      foregroundColor: InteraColors.primary,
                      onPressed: () {},
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
