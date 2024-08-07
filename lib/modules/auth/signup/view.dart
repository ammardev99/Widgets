import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:widgets/routes/routes_name.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/utilities/validators.dart';
import 'package:widgets/widgets/back_icon_button.dart';
import 'package:widgets/widgets/formating.dart';
import 'package:widgets/widgets/input_form_field.dart';

import 'logic.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final logic = Get.put(SignupLogic());
  final state = Get.find<SignupLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: backPop(),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20),
          child: Form(
            key: logic.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sizeBox(44),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: SvgPicture.asset('assets/svg/app_logo.svg'),
                ),
                sizeBox(20),
                customTitle('Sign up'),
                sizeBox(10),
                InputFormFieldApp(
                  label: 'Name',
                  hint: 'Enter your full name',
                  controller: state.userFullName!,
                  inputType: TextInputType.name,
                  validator: validateFullName,
                ),
                sizeBox(15),
                InputFormFieldApp(
                    label: 'Email',
                    hint: 'Enter your email',
                    controller: state.userEmail!,
                    inputType: TextInputType.emailAddress,
                    validator: validateEmail),
                sizeBox(15),
                InputFormFieldApp(
                  label: 'Password',
                  hint: 'Enter your password',
                  controller: state.userPassword!,
                  inputType: TextInputType.text,
                  validator: validatePassword6digit,
                ),
                sizeBox(30),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.primary),
                        minimumSize:
                            WidgetStatePropertyAll(Size(double.infinity, 50))),
                    onPressed: () {
                      logic.signup();
                    },
                    child: customHeading("Sign up", AppColors.white)),
                sizeBox(30),
                actionText('Already have an account?', 'Login', RouteName.login),
                sizeBox(30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
