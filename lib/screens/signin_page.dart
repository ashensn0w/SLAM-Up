import 'package:flutter/material.dart';
import 'package:slam_up/utils/constants.dart';
import '../utils/sizes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
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
              decoration: BoxDecoration(
                color: primLightBg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),

                ),
              ),
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 400),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
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
                              BorderSide(color: Colors.black, width: 2.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            filled: false,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
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
                            hide_password_button,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        filled: false,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    Container(
                        height: 45,
                        width: 450,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient:
                            LinearGradient(colors: [navBarBg, navBarBg])),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: fontSizes.fontsizeSm,
                              fontWeight: FontWeight.w500,
                              color: lighterText,
                            ),
                          ),
                        )),
                    SizedBox(height: 60),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Dont have any account?",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: darkText,
                              fontSize: fontSizes.fontsizeSm,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Sign Up",
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


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}
