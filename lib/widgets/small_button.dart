import 'package:flutter/material.dart';

class SmallButton extends StatefulWidget {
  Image image;
  VoidCallback onTap;
  SmallButton({super.key, required this.image, required this.onTap});

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(padding: const EdgeInsets.all(5.0), child: widget.image),
      ),
    );
  }
}
