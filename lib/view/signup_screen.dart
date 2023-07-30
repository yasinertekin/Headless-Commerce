import 'package:flutter/material.dart ';
import 'package:headless_commerce/components/CustomButton/custom_button.dart';
import 'package:headless_commerce/routing/app_router.dart';
import 'package:headless_commerce/styles/colors.dart';
import 'package:headless_commerce/view/send_otp_screen.dart';

import 'login_screen_view.dart';

class SignUpScreen extends StatelessWidget with NavigatorManager {
  const SignUpScreen({super.key});
  final String _title = 'Welcome to tradly';
  final String _description = 'Signup to your account';
  final String _buttonText = 'Create';
  final String _nameHintText = 'First Name';
  final String _lastNameHintText = 'Last Name';
  final String _emailHintText = 'Email ID/Phone Number';
  final String _passwordHintText = 'Password';
  final String _reEnterPasswordHintText = 'Re-enter Password';
  final String _accountText = 'Already have an account?';
  final String _signIn = 'Sign in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColor().illuminatingEmerald,
      ),
      backgroundColor: MyColor().illuminatingEmerald,
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 25,
                  child: Text(
                    _title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: MyColor().white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Expanded(
                  flex: 25,
                  child: Text(
                    _description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: MyColor().white,
                          fontSize: 15,
                        ),
                  ),
                ),
                CustomTextFieldWidget(
                  hint: _nameHintText,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                CustomTextFieldWidget(
                  hint: _lastNameHintText,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                CustomTextFieldWidget(
                  hint: _emailHintText,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                CustomTextFieldWidget(
                  hint: _passwordHintText,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                ),
                CustomTextFieldWidget(
                  hint: _reEnterPasswordHintText,
                  keyboardType: TextInputType.name,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomButton(
                    onPressed: () {
                      navigatoToWidget(context, const VerificationScreen());
                    },
                    backgroundColor: MyColor().white,
                    buttonText: _buttonText,
                    textColor: MyColor().illuminatingEmerald,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _accountText,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: MyColor().white,
                            fontSize: 15,
                          ),
                    ),
                    TextButton(
                      onPressed: () {
                        navigatoToWidget(context, const LoginScreen());
                      },
                      child: Text(
                        _signIn,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: MyColor().white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
