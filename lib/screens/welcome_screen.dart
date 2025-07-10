import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedexx/screens/login_screen.dart';
import 'package:pokedexx/screens/registration_screen.dart';
import 'package:pokedexx/widgets/buttons.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lottie/pokeball.json',
                height: height * 0.5,
                width: width * 0.5,
              ),
              Text(
                'Welcome to',
                style: GoogleFonts.pixelifySans(
                  textStyle: TextStyle(
                    color: Colors.blueGrey.shade400,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
              Text(
                'Discover Every Pokémon',
                style: GoogleFonts.pixelifySans(
                  textStyle: TextStyle(
                    color: Colors.orange.shade400,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Buttons(
                text: "Sign In",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                },
              ),
              Buttons(
                text: "Register",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => RegistrationScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
