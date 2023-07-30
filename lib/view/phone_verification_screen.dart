import 'package:flutter/material.dart';
import 'package:headless_commerce/components/CustomButton/custom_button.dart';
import 'package:headless_commerce/routing/app_router.dart';
import 'package:headless_commerce/styles/colors.dart';
import 'package:headless_commerce/view/login_screen_view.dart';

class PhoneVerification extends StatelessWidget with NavigatorManager {
  const PhoneVerification({super.key});
  final String _title = 'Phone Verification';
  final String _description = 'Enter your OTP code here';
  final String _buttonText = 'Verify';
  final String subtitle = "Didn’t you received any code? \nResent new code";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor().illuminatingEmerald,
        elevation: 0,
      ),
      backgroundColor: MyColor().illuminatingEmerald,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              _title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: MyColor().white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(_description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: MyColor().white,
                      fontSize: 16,
                    )),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: const [
                Expanded(
                  child: _otpTextField(
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Expanded(
                  child: _otpTextField(
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Expanded(
                  child: _otpTextField(
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Expanded(
                  child: _otpTextField(
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Expanded(
                    child: _otpTextField(
                  textInputAction: TextInputAction.next,
                )),
                Expanded(
                    child: _otpTextField(
                  textInputAction: TextInputAction.done,
                )),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              textAlign: TextAlign.center,
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: MyColor().white,
                    fontSize: 16,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                backgroundColor: MyColor().white,
                buttonText: _buttonText,
                onPressed: () {
                  navigatoToWidget(
                    context,
                    const LoginScreen(),
                  );
                },
                textColor: MyColor().illuminatingEmerald,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _otpTextField extends StatelessWidget {
  const _otpTextField({required this.textInputAction});

  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        textAlign: TextAlign.center,
        maxLength: 1,
        textInputAction: textInputAction,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: MyColor().white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
        cursorColor: MyColor().white,
        decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: MyColor().white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          // Eklediğimiz yeni kısım:
          counterText: '',
          // Boş metin belirtiyoruz
          hintText: '', // Boş metin belirtiyoruz
        ),
      ),
    );
  }
}
