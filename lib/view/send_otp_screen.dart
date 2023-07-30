import 'package:flutter/material.dart';
import 'package:headless_commerce/components/CustomButton/custom_button.dart';
import 'package:headless_commerce/routing/app_router.dart';
import 'package:headless_commerce/styles/colors.dart';
import 'package:headless_commerce/view/phone_verification_screen.dart';

import 'login_screen_view.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> with NavigatorManager {
  String selectedCode = '+90'; // Varsayılan olarak seçilen alan kodu
  final String _title = 'Verify your phone number';
  final String _description = 'We have sent you an SMS with a code to \n enter number';
  final String _otherOption = 'Or login  with Social network';
  final String _buttonText = 'Next';
  final String _enterNumberHintText = 'Enter Number';
  final List<String> _countryCodes = ['+90', '+1']; // İstediğiniz alan kodlarını buraya ekleyin

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor().illuminatingEmerald,
      appBar: AppBar(
        backgroundColor: MyColor().illuminatingEmerald,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: MyColor().white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Text(
              textAlign: TextAlign.center,
              _description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: MyColor().white,
                    fontSize: 16,
                  )),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: CustomTextFieldWidget(
              hint: _enterNumberHintText,
              keyboardType: TextInputType.number,
              obscureText: false,
              textInputAction: TextInputAction.done,
              icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: DropdownButton<String>(
                  dropdownColor: MyColor().illuminatingEmerald,
                  underline: const SizedBox(),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: MyColor().white,
                  ),
                  value: selectedCode,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCode = newValue!;
                    });
                  },
                  items: _countryCodes // İstediğiniz alan kodlarını buraya ekleyin
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: MyColor().white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Text(_otherOption,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: MyColor().white,
                    fontSize: 16,
                  )),
          const SizedBox(
            height: 25.0,
          ),
          CustomButton(
            onPressed: () {
              navigatoToWidget(context, const PhoneVerification());
            },
            backgroundColor: MyColor().white,
            buttonText: _buttonText,
            textColor: MyColor().illuminatingEmerald,
          ),
        ],
      ),
    );
  }
}
