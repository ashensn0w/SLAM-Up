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
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: fontSizes.fontsizeSm,
            fontWeight: FontWeight.w500,
            color: darkText,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                  color: Color(0xFFA9A9A9), width: 2.0), // Set color to black
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 15.0, left: 70.0),
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: fontSizes.fontsizeMd,
              color: lighterText,
            ),
          ),
        ),
        backgroundColor: seconDarkBg,
        elevation: 0, // Remove the shadow
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Handle the back button press
          },
          child: Image.asset(
            lightBackButton,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Header
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [seconDarkBg, seconDarkBg]),
            ),
          ),

          // White background
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              decoration: const BoxDecoration(
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
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildInputField('Full Name', TextEditingController()),
                    const SizedBox(height: 10),
                    buildInputField('Username', TextEditingController()),
                    const SizedBox(height: 10),
                    buildInputField('Email', TextEditingController()),
                    const SizedBox(height: 10),
                    buildInputField('Password', TextEditingController(),
                        obscureText: true),
                    const SizedBox(height: 10),
                    buildInputField('Confirm Password', TextEditingController(),
                        obscureText: true),
                    const SizedBox(height: 20), // Adjusted spacing
                    const SizedBox(height: 20),
                    Container(
                      height: 45,
                      width: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient:
                              const LinearGradient(colors: [navBarBg, navBarBg])),
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: fontSizes.fontsizeSm,
                            fontWeight: FontWeight.w500,
                            color: lighterText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: darkText,
                              fontSize: fontSizes.fontsizeSm,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: darkText,
                                  fontSize: fontSizes.fontsizeSm,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
