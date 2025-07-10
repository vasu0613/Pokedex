import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pokedexx/screens/forget_password.dart';
import 'package:pokedexx/screens/home_screen.dart';
import 'package:pokedexx/screens/registration_screen.dart';
import 'package:pokedexx/widgets/buttons.dart';
import 'package:pokedexx/widgets/small_button.dart';
import 'package:pokedexx/widgets/text_field_comp.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    emailController.addListener(() {
      listener:
      (context);
    });
    passController.addListener(() {
      listener:
      (context);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.removeListener(() {
      listener:
      (context);
    });
    passController.removeListener(() {
      listener:
      (context);
    });
    super.dispose();
  }

  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

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
          child: Form(
            key: formkey,
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
                  TextFieldComp(
                    hintText: 'e.g. abc@xyz.com',
                    controller: emailController,
                    obText: false,
                    keyboardType: TextInputType.emailAddress,
                    //sufIcon: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    preIcon: Icon(Icons.email),
                    labelText: 'Username',
                  ),
                  TextFieldComp(
                    hintText: '********',
                    controller: passController,
                    obText: false,
                    keyboardType: TextInputType.text,
                    sufIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_red_eye),
                    ),
                    preIcon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                  SizedBox(height: height * 0.01),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ForgetPassword()),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Buttons(
                    text: "Sign In",
                    onTap: () {
                      loginUser();
                      final form = formkey.currentState!;
                      String email = emailController.text;
                      String password = passController.text;
                      if (form.validate()) {
                        final email = emailController.text;
                        final password = passController.text;
                      }
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RegistrationScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        Text(
                          ' or ',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 18,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SmallButton(
                        image: Image.asset('assets/images/google.png'),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Coming Soon'),
                              content: Text(
                                'This option will be available soon...',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          );
                        },
                      ),
                      SmallButton(
                        image: Image.asset('assets/images/facebook.png'),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Coming Soon'),
                              content: Text(
                                'This option will be available soon...',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          );
                        },
                      ),
                      SmallButton(
                        image: Image.asset('assets/images/apple.png'),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Coming Soon'),
                              content: Text(
                                'This option will be available soon...',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          );
                        },
                      ),
                      SmallButton(
                        image: Image.asset('assets/images/x.png'),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Coming Soon'),
                              content: Text(
                                'This option will be available soon...',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginUser() {
    if (passController.text == "") {
      Fluttertoast.showToast(
        msg: "Please enter password",
        backgroundColor: Colors.red,
      );
    } else {
      String email = emailController.text;
      String password = passController.text;
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
          })
          .catchError((e) {
            Fluttertoast.showToast(msg: '$e', backgroundColor: Colors.red);
          });
    }
  }
}
