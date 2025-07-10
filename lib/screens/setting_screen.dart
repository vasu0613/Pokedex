import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedexx/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _switchValue = false;
  void toggleSwitch(bool value) {
    setState(() {
      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
      _switchValue = !_switchValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'S E T T I N G',
          style: GoogleFonts.pixelifySans(
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.primaryFixed,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.tertiary),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListTile(
          leading: Icon(Icons.format_paint_rounded, size: 50),
          title: Text('Change Theme', style: TextStyle(fontSize: 25)),
          subtitle: _switchValue
              ? Text('Dark Mode', style: TextStyle(fontSize: 20))
              : Text('Light Mode', style: TextStyle(fontSize: 20)),

          trailing: Switch(value: _switchValue, onChanged: toggleSwitch),
        ),
      ),
    );
  }
}
