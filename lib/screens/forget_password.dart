import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedexx/screens/login_screen.dart';
import 'package:pokedexx/widgets/buttons.dart';
import 'package:pokedexx/widgets/text_field_comp.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text('Password reset link sent! Check your email'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(content: Text(e.message.toString()));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'P O K É D E X',
                  style: GoogleFonts.pixelifySans(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primaryFixed,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Lottie.asset(
                  'assets/lottie/password.json',
                  width: 300,
                  height: 300,
                ),
                SizedBox(height: height * 0.02),
                TextFieldComp(
                  hintText: 'e.g. abc@xyz.com',
                  controller: _emailController,
                  obText: false,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'E-mail',
                  preIcon: Icon(Icons.email),
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'By continuing, you agree to our ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Terms and Condition'),
                            content: Text(
                              'The password reset link will be sent to your email.',
                              style: TextStyle(fontSize: 20),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        'Terms and Condition',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Buttons(
                  text: 'Reset Password',
                  onTap: () {
                    passwordReset();
                  },
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Remember your password? ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
