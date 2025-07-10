import 'package:flutter/material.dart';

class TextFieldComp extends StatefulWidget {
  TextInputType? keyboardType;
  String hintText;
  String labelText;
  bool? obText;
  TextEditingController? controller;
  IconButton? sufIcon;
  Icon? preIcon;

  TextFieldComp({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obText,
    required this.keyboardType,
    required this.labelText,
    this.sufIcon,
    required this.preIcon,
  });

  @override
  State<TextFieldComp> createState() => _TextFieldCompState();
}

class _TextFieldCompState extends State<TextFieldComp> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: height * 0.08,
        width: width * 0.8,
        child: TextFormField(
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          decoration: InputDecoration(
            hintText: widget.hintText,
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
                width: 2,
              ),
            ),

            prefixIcon: widget.preIcon,
            prefixIconColor: Theme.of(context).colorScheme.tertiary,
            suffixIcon: widget.sufIcon,
            suffixIconColor: Theme.of(context).colorScheme.tertiary,
          ),
          obscureText: widget.obText ?? false,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
        ),
      ),
    );
  }
}
