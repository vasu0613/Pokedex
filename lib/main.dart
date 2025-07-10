import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pokedexx/provider/theme.dart';
import 'package:pokedexx/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:pokedexx/screens/home_screen.dart';
import 'package:pokedexx/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser != null
          ? HomeScreen()
          : WelcomeScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
