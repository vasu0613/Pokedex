import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedexx/screens/home_screen.dart';
import 'package:pokedexx/screens/login_screen.dart';
import 'package:pokedexx/widgets/buttons.dart';
import 'package:pokedexx/widgets/small_button.dart';
import 'package:pokedexx/widgets/text_field_comp.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formkey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _pass2Controller = TextEditingController();
  bool obscureText = false;
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
                    hintText: 'e.g. John Doe',
                    controller: _nameController,
                    obText: false,
                    keyboardType: TextInputType.text,
                    labelText: 'Name',
                    preIcon: Icon(Icons.person),
                  ),

                  TextFieldComp(
                    hintText: 'yyyy-mm-dd',
                    controller: _dobController,
                    obText: false,
                    keyboardType: TextInputType.datetime,
                    labelText: 'Date of Birth',
                    sufIcon: IconButton(
                      onPressed: () {
                        _selectDate();
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                    preIcon: Icon(Icons.date_range),
                  ),

                  TextFieldComp(
                    hintText: 'e.g. abc@xyz.com',
                    controller: _emailController,
                    obText: false,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Email',
                    preIcon: Icon(Icons.email),
                  ),
                  TextFieldComp(
                    hintText: '********',
                    controller: _passController,
                    obText: true,
                    keyboardType: TextInputType.text,
                    labelText: 'Password',
                    sufIcon: _passController.text.isEmpty
                        ? IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add, size: 1, color: Colors.black),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = false;
                              });
                            },
                            icon: Icon(Icons.remove_red_eye),
                          ),
                    preIcon: Icon(Icons.lock),
                  ),
                  TextFieldComp(
                    hintText: '********',
                    controller: _pass2Controller,
                    obText: true,
                    keyboardType: TextInputType.text,
                    labelText: 'Confirm Password',
                    sufIcon: _pass2Controller.text.isEmpty
                        ? IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add, size: 1, color: Colors.black),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = false;
                              });
                            },
                            icon: Icon(Icons.remove_red_eye),
                          ),
                    preIcon: Icon(Icons.lock),
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
                                'Your account will be created and you will be able to login.\nRemember your password.',
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
                    text: 'Register',
                    onTap: () {
                      print('pressed');
                      registerUser();
                      final form = formkey.currentState!;
                      String email = _emailController.text;
                      String password = _passController.text;
                      String name = _nameController.text;
                      //print('$email is the mail');
                      //print('$password is the password');
                      //print('$name is the name');
                      if (form.validate()) {
                        final email = _emailController.text;
                        final password = _passController.text;
                        //final name = nameController.text;
                      }
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
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
                            color: Theme.of(context).colorScheme.tertiary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (_picked != null) {
      setState(() {
        _dobController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  void registerUser() {
    if (_nameController.text == '') {
      Fluttertoast.showToast(
        msg: 'Please enter your name',
        backgroundColor: Colors.red,
      );
    } else if (_dobController.text == '') {
      Fluttertoast.showToast(
        msg: 'Please enter your date of birth',
        backgroundColor: Colors.red,
      );
    } else if (_emailController.text == '') {
      Fluttertoast.showToast(
        msg: 'Please enter your email',
        backgroundColor: Colors.red,
      );
    } else if (_passController.text == '' || _pass2Controller.text == '') {
      Fluttertoast.showToast(
        msg: 'Please enter your password correctly',
        backgroundColor: Colors.red,
      );
    } else if (_passController.text != _pass2Controller.text) {
      Fluttertoast.showToast(
        msg: 'Passwords do not match',
        backgroundColor: Colors.red,
      );
    } else {
      String email = _emailController.text;
      String password = _passController.text;
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
            if (value != null) {
              var user = value.user;
              var uid = user!.uid;
              addUserData(uid);
            }
          })
          .catchError((e) {
            Fluttertoast.showToast(msg: '$e', backgroundColor: Colors.red);
          });
    }
  }

  void addUserData(String uid) {
    Map<String, dynamic> userData = {
      'name': _nameController.text,
      'dob': _dobController.text,
      'email': _emailController.text,
      'password': _passController.text,
      'uid': uid,
    };
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(userData)
        .then((value) {
          Fluttertoast.showToast(
            msg: 'Account created successfully',
            backgroundColor: Colors.green,
          );
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
