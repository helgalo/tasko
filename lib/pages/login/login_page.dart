import 'package:flutter/material.dart';
import 'package:tasko/core/theme/core_colors.dart';
import 'package:tasko/core/theme/core_text_styles.dart';
import 'package:tasko/pages/login/login_controller.dart';
import 'package:tasko/widgets/basic_button_widget.dart';
import 'package:tasko/widgets/basic_checkbox_button_widget.dart';
import 'package:tasko/widgets/basic_input_textfield_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController provider = LoginController();

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
                            onTap: provider.goToHome,
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
                          const BasicInputTextFieldWidget(
                            hintText: "Your email",
                            label: "Email",
                            keyboardType: TextInputType.emailAddress,
                            // controller: provider.emailController,
                            // onChanged: (_) => provider.validateEmail(),
                          ),
                          const SizedBox(height: 24),
                          const BasicInputTextFieldWidget(
                            keyboardType: TextInputType.visiblePassword,
                            hintText: "Your password",
                            label: "Password",
                            // isObscure: provider.isObscurePassword,
                            // controller: provider.passwordController,
                            // onTapPasswordVisibleButton: () =>
                            //     provider.changeIsObscurePassword(
                            //         !provider.isObscurePassword),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  BasicCheckboxWidget(
                                    checked: true,
                                    // onTap: provider.changeRemember,
                                    onTap: (_) {},
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
                  BasicButtonWidget(
                    // onPressed: provider.login,
                    onPressed: () {},
                    title: "Login",
                    isLoading: false,
                    // type: provider.isEmailValid && provider.isValidPassword
                    //     ? ButtonTypes.primary
                    //     : ButtonTypes.secondary,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
