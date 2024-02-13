import 'package:flutter/material.dart';
import 'package:slam_up/screens/signin_page.dart';
import 'package:slam_up/utils/constants.dart';
import '../utils/sizes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isPasswordHidden = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _fullNameController;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
          ),

          // White background
          Padding(
            padding: const EdgeInsets.only(top: 120),
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

          // "Sign Up" text
          const Positioned(
            top: 60,
            left: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: fontSizes.fontsizeMd,
                    color: lighterText,
                  ),
                ),
              ],
            ),
          ),

          // Form
          SingleChildScrollView(
            child: Padding(
              padding:
              const EdgeInsets.only(left: 20.0, right: 20.0, top: 170), // Adjusted top padding
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Full Name',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: fontSizes.fontsizeSm,
                            fontWeight: FontWeight.w500,
                            color: darkText,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _fullNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Color(0xFFA9A9A9),
                                width: 2.0,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            filled: false,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        const SizedBox(height: 5),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _usernameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Color(0xFFA9A9A9),
                                width: 2.0,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            filled: false,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: fontSizes.fontsizeSm,
                            fontWeight: FontWeight.w500,
                            color: darkText,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Color(0xFFA9A9A9),
                                width: 2.0,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            filled: false,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            // Regular expression for basic email validation
                            // This pattern checks if the entered email contains @ followed by a domain.
                            // You can customize this pattern according to your specific requirements.
                            final emailPattern = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (!emailPattern.hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: fontSizes.fontsizeSm,
                            fontWeight: FontWeight.w500,
                            color: darkText,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _passwordController,
                          obscureText: _isPasswordHidden,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Color(0xFFA9A9A9),
                                width: 2.0,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                            filled: false,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordHidden = !_isPasswordHidden;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            // Regular expression for password validation
                            // This pattern requires at least one uppercase letter,
                            // one lowercase letter, one digit, and one special character.
                            final passwordPattern = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
                            if (!passwordPattern.hasMatch(value)) {
                              return 'Password must contain at least:\n'
                                  '- One uppercase, lowercase, digit, special character\n'
                                  '- Minimum of 8 characters';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 20), // Added SizedBox for spacing

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Proceed with registration
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: navBarBg,
                        minimumSize: const Size(450, 45),
                      ),
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: fontSizes.fontsizeSm,
                          fontWeight: FontWeight.w500,
                          color: lighterText,
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
                            "Already have an account?",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: darkText,
                              fontSize: fontSizes.fontsizeSm,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SigninPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: darkText,
                                fontSize: fontSizes.fontsizeSm,
                                fontWeight: FontWeight.bold,
                              ),
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
