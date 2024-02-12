import 'package:flutter/material.dart';
import 'package:slam_up/screens/signup_page.dart';
import 'package:slam_up/utils/constants.dart';
import '../utils/sizes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [seconDarkBg, seconDarkBg],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                color: primLightBg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              height: double.infinity,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.only(top: 100.0, left: 145.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: fontSizes.fontsizeLg,
                    color: darkText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Username',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: fontSizes.fontsizeSm,
                          fontWeight: FontWeight.w500,
                          color: darkText,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          filled: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: fontSizes.fontsizeSm,
                          fontWeight: FontWeight.w500,
                          color: darkText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                        child: Image.asset(
                          _isPasswordHidden
                              ? hidePassButton
                              : hidePassButton,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Colors.black, width: 2.0),
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      filled: false,
                    ),
                    obscureText: _isPasswordHidden,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: navBarBg,
                      minimumSize: const Size(450, 45),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: fontSizes.fontsizeSm,
                        fontWeight: FontWeight.w500,
                        color: lighterText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have any account?",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: darkText,
                            fontSize: fontSizes.fontsizeSm,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()),
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: darkText,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: fontSizes.fontsizeSm,
                              ),
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}