import 'package:flutter/material.dart';
import 'package:headless_commerce/components/CustomButton/custom_button.dart';
import 'package:headless_commerce/routing/app_router.dart';
import 'package:headless_commerce/styles/colors.dart';
import 'package:headless_commerce/view/default_tab_bar_controller.dart';
import 'package:headless_commerce/view/signup_screen.dart';

class LoginScreen extends StatelessWidget with NavigatorManager {
  const LoginScreen({super.key});

  final String title = 'Welcome to tradly';
  final String description = 'Login to your account';
  final String buttonText = 'Login';
  final String forgotPassword = 'Forgot your password?';
  final String dontHaveAccount = 'Dont have an account?';
  final String signUp = 'Sign up';
  final String hintTextFieldEmail = 'Email/Mobile Number';
  final String hintTextFieldPassword = 'Password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyColor().illuminatingEmerald,
        ),
        backgroundColor: MyColor().illuminatingEmerald,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: MyColor().white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: MyColor().white,
                      fontSize: 15,
                    ),
              ),
            ),
            CustomTextFieldWidget(
              hint: hintTextFieldEmail,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              textInputAction: TextInputAction.next,
            ),
            CustomTextFieldWidget(
              hint: hintTextFieldPassword,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                onPressed: () {
                  navigatoToWidget(context, const TabBarController());
                },
                backgroundColor: MyColor().white,
                buttonText: buttonText,
                textColor: MyColor().illuminatingEmerald,
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  forgotPassword,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MyColor().white,
                        fontSize: 15,
                      ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dontHaveAccount,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: MyColor().white,
                          fontSize: 15,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      navigatoToWidget(context, const SignUpScreen());
                    },
                    child: Text(
                      signUp,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: MyColor().white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    required this.hint,
    required this.keyboardType,
    this.obscureText = false,
    this.icon,
    this.dropdownButton,
    required this.textInputAction,
  }) : super(key: key);

  final String hint;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? icon;
  final DropdownButton<String>? dropdownButton;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: MyColor().white,
              fontSize: 15,
            ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        textInputAction: textInputAction,
        decoration: InputDecoration(
          filled: true,
          focusColor: MyColor().white,
          hoverColor: MyColor().white,

          prefixIcon: icon,
          suffixIcon: dropdownButton, // DropdownButton burada yerleştiriliyor
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }

  Future<T?> navigatoToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ));
  }
}
