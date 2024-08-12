import 'package:flutter/material.dart';
import 'package:tasko/core/theme/core_colors.dart';
import 'package:tasko/core/theme/core_text_styles.dart';
import 'package:tasko/stores/login/login_store.dart';
import 'package:tasko/widgets/main_button_widget.dart';
import 'package:tasko/widgets/main_checkbox_button_widget.dart';
import 'package:tasko/widgets/main_input_textfield_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore store = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreColors.coreBackground,
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back!",
                    style: CoreTextStyles.publicSans(
                      fontSize: 32,
                      fontWeight: FontWeightEnum.bold_700,
                      color: CoreColors.primaryTextColor,
                    ),
                  ),
                  const SizedBox(),
                  Column(
                    children: [
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Text(
                            "Newbie?",
                            style: CoreTextStyles.publicSans(
                              fontSize: 14,
                              fontWeight: FontWeightEnum.regular_400,
                              color: CoreColors.coreSecondaryColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: store.goToHome,
                            child: Text(
                              "Sing up now!",
                              style: CoreTextStyles.publicSans(
                                fontSize: 14,
                                fontWeight: FontWeightEnum.regular_400,
                                color: CoreColors.corePrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),
                      //Body
                      Column(
                        children: [
                          Observer(
                            builder: (_) => MainInputTextFieldWidget(
                              styleType: store.errorMessage != null
                                  ? TextFieldType.error
                                  : TextFieldType.primary,
                              hintText: "Your email",
                              label: "Email",
                              keyboardType: TextInputType.emailAddress,
                              controller: store.emailController,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Observer(
                            builder: (_) => MainInputTextFieldWidget(
                              styleType: store.errorMessage != null
                                  ? TextFieldType.error
                                  : TextFieldType.primary,
                              keyboardType: TextInputType.visiblePassword,
                              hintText: "Your password",
                              label: "Password",
                              isObscure: !store.passwordVisible,
                              controller: store.passwordController,
                              onTapPasswordVisibleButton:
                                  store.togglePasswordVisibility,
                              infoMessage: store.errorMessage,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Observer(
                                    builder: (context) => MainCheckboxWidget(
                                      checked: store.rememberMe,
                                      onTap: store.toggleRememberMe,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  SizedBox(
                                    child: Text(
                                      "Remember me",
                                      style: CoreTextStyles.publicSans(
                                        fontSize: 14,
                                        fontWeight: FontWeightEnum.regular_400,
                                        color: CoreColors.primaryTextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                  Observer(
                    builder: (_) => MainButtonWidget(
                      onPressed: store.login,
                      title: "Login",
                      isLoading: store.isLoading,
                      // type: provider.isEmailValid && provider.isValidPassword
                      //     ? ButtonTypes.primary
                      //     : ButtonTypes.secondary,
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
