import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:widgets/routes/routes_name.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/utilities/validators.dart';
import 'package:widgets/widgets/loading_circle.dart';
import 'package:widgets/widgets/formating.dart';
import 'package:widgets/widgets/input_form_field.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final logic = Get.put(LoginLogic());
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20),
          child: Form(
            key: logic.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sizeBox(100),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: SvgPicture.asset('assets/svg/app_logo.svg'),
                ),
                sizeBox(20),
                customTitle('Login'),
                sizeBox(10),
                InputFormFieldApp(
                  label: 'Email',
                  hint: 'Enter your email',
                  controller: state.userEmail!,
                  inputType: TextInputType.emailAddress,
                  validator: validateEmail,
                ),
                sizeBox(15),
                InputFormFieldApp(
                  label: 'Password',
                  hint: 'Enter your password',
                  controller: state.userPassword!,
                  inputType: TextInputType.text,
                  validator: validatePassword6digit,
                ),
                sizeBox(30),
                Obx(() {
                  return ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(AppColors.primary),
                          minimumSize: WidgetStatePropertyAll(
                              Size(double.infinity, 50))),
                      onPressed: () {
                        logic.login();
                      },
                      child: state.isLoading.value == true
                          ? loadingCircle(25, Colors.white)
                          : customHeading("Sign in", AppColors.white));
                }),
                sizeBox(30),
                actionText(
                    'Don’t have an  account?', 'Sign up', RouteName.signup),
                sizeBox(30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
