import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'F A V O U R I T E',
          style: GoogleFonts.pixelifySans(
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.primaryFixed,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.tertiary),
      ),
      body: Center(
        child: Text(
          textAlign: TextAlign.center,
          "This feature will be available in next update.\nThank you for your support.",
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.tertiary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
