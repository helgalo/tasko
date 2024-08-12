import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasko/core/theme/core_colors.dart';
import 'package:tasko/core/theme/core_text_styles.dart';
import 'package:tasko/pages/register/register_controller.dart';
import 'package:tasko/widgets/main_button_widget.dart';
import 'package:tasko/widgets/main_input_textfield_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController provider = RegisterController();

    return Scaffold(
      backgroundColor: CoreColors.coreBackground,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register now",
                  style: CoreTextStyles.publicSans(
                    fontSize: 32,
                    fontWeight: FontWeightEnum.bold_700,
                    color: CoreColors.primaryTextColor,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Text(
                          "I already have an account!",
                          style: CoreTextStyles.publicSans(
                            fontSize: 14,
                            fontWeight: FontWeightEnum.regular_400,
                            color: CoreColors.coreSecondaryColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            provider.goToLogin();
                          },
                          child: Text(
                            "Login now!",
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
                    Column(
                      children: [
                        MainInputTextFieldWidget(
                          hintText: "jane_doe@gmail.com",
                          label: "Email",
                          keyboardType: TextInputType.emailAddress,
                          controller: provider.emailController,
                          // onChanged: (_) => provider.validateEmail(),
                        ),
                        const SizedBox(height: 24),
                        MainInputTextFieldWidget(
                          keyboardType: TextInputType.visiblePassword,
                          hintText: "Your password",
                          label: "Password",
                          isObscure: provider.passwordVisible,
                          controller: provider.passwordController,
                          // onTapPasswordVisibleButton: () =>
                          //     provider.changeIsObscurePassword(
                          //         !provider.isObscurePassword),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
                Observer(
                  builder: (_) => MainButtonWidget(
                    onPressed: provider.login,
                    title: "Register",
                    isLoading: provider.isLoading,
                    // type: provider.isEmailValid && provider.isValidPassword
                    //     ? ButtonTypes.primary
                    //     : ButtonTypes.secondary,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
