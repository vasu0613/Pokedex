import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {
  CachedNetworkImage pokeImage;
  String pokeName;
  String pokeType;
  Color? bgColor;
  final tag;
  final pokeDetail;
  DetailScreen({
    super.key,
    required this.pokeImage,
    required this.pokeName,
    required this.pokeType,
    required this.bgColor,
    required this.tag,
    required this.pokeDetail,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String _getString(dynamic value, [String defaultValue = 'N/A']) {
      return value?.toString() ?? defaultValue;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'P O K É D E X',
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
      body: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.pokeImage,
              ),
              Text(
                widget.pokeName,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: widget.bgColor,
                ),
              ),
              Text(
                widget.pokeType,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: widget.bgColor,
                ),
              ),
              SizedBox(height: height * 0.04),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: widget.bgColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDetailRow(
                          'Height:',
                          _getString(widget.pokeDetail['height']),
                        ),
                        SizedBox(height: 8),
                        _buildDetailRow(
                          'Weight:',
                          _getString(widget.pokeDetail['weight']),
                        ),
                        SizedBox(height: 8),
                        _buildDetailRow(
                          'Avg Spawns:',
                          _getString(widget.pokeDetail['avg_spawns']),
                        ),
                        SizedBox(height: 8),
                        _buildDetailRow(
                          'Spawn Chance:',
                          _getString(widget.pokeDetail['spawn_chance']),
                        ), // Example: added another field
                        SizedBox(height: 8),
                        _buildDetailRow(
                          'Spawn Time:',
                          _getString(widget.pokeDetail['spawn_time']),
                        ), // Example: added another field
                        SizedBox(height: 8),
                        _buildDetailRow(
                          'Multipliers:',
                          _getString(widget.pokeDetail['multipliers']),
                        ),
                        SizedBox(height: 8),
                        _buildDetailRow(
                          'Pre Evolution:',
                          _getEvolutionName(
                            widget.pokeDetail['prev_evolution'],
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildDetailRow(
                          'Next Evolution:',
                          _getEvolutionName(
                            widget.pokeDetail['next_evolution'],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Weaknesses:',
                          style: TextStyle(
                            fontSize: 23,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        // Assuming 'weaknesses' is a List<String> or List<dynamic>
                        if (widget.pokeDetail['weaknesses'] != null &&
                            widget.pokeDetail['weaknesses'] is List)
                          Wrap(
                            // Use Wrap for multiple items
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: (widget.pokeDetail['weaknesses'] as List)
                                .map<Widget>((weakness) {
                                  return Chip(
                                    label: Text(
                                      weakness.toString(),
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.surface,
                                        fontSize: 20,
                                      ),
                                    ),
                                    backgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.tertiary,
                                  );
                                })
                                .toList(),
                          )
                        else
                          Text(
                            _getString(widget.pokeDetail['weaknesses']),
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ), // Fallback
                      ],
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

  String _getEvolutionName(dynamic evolutionList) {
    if (evolutionList != null &&
        evolutionList is List &&
        evolutionList.isNotEmpty) {
      // Ensure the first element is a map and contains 'name'
      if (evolutionList[0] != null &&
          evolutionList[0] is Map &&
          evolutionList[0]['name'] != null) {
        return evolutionList[0]['name'].toString();
      }
    }
    return 'N/A'; // Default if not found or list is invalid
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 23,
            //fontWeight: FontWeight.bold,
            color: Colors.black54,
          ), // Softer white
        ),
        SizedBox(width: 10),
        Expanded(
          // Allow value to take remaining space and wrap if needed
          child: Text(
            value,
            textAlign: TextAlign.end, // Align value to the end
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
