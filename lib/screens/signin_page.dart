import 'package:flutter/material.dart';
import 'package:slam_up/utils/constants.dart';
import '../utils/sizes.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  Widget buildInputField(String label, TextEditingController controller,
      {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: fontSizes.fontsizeSm,
            fontWeight: FontWeight.w500,
            color: darkText,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            filled: false,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Header
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [seconDarkBg, seconDarkBg]),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 70, left: 140),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: fontSizes.fontsizeMd,
                  fontWeight: FontWeight.bold,
                  color: lighterText,
                ),
              ),
            ),
          ),

          // White background
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(85),
                ),
                color: primLightBg,
              ),
              height: double.infinity,
              width: double.infinity,
            ),
          ),

          // Form
          SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildInputField('Full Name', TextEditingController()),
                    const SizedBox(height: 10),
                    buildInputField('Username', TextEditingController()),
                    const SizedBox(height: 10),
                    buildInputField('Gmail', TextEditingController()),
                    const SizedBox(height: 10),
                    buildInputField('Password', TextEditingController(),
                        obscureText: true),
                    const SizedBox(height: 10),
                    buildInputField('Confirm Password', TextEditingController(),
                        obscureText: true),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
