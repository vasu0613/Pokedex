import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokeCard extends StatefulWidget {
  String pokeName;
  String pokeType;
  CachedNetworkImage pokeImage;
  Color? bgColor;
  VoidCallback Tap;
  PokeCard({
    super.key,
    required this.pokeName,
    required this.pokeType,
    required this.pokeImage,
    required this.bgColor,
    required this.Tap,
  });

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: widget.Tap,
        child: Container(
          height: height * 0.3,
          width: width * 0.3,
          decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 20,
                right: 20,
                width: 100,
                height: 100,
                child: widget.pokeImage,
              ),
              Positioned(
                top: 20,
                left: 10,
                child: Text(
                  widget.pokeName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 2.0,
                      bottom: 2.0,
                      left: 5,
                      right: 5,
                    ),
                    child: Text(
                      widget.pokeType,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
