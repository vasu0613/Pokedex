import 'dart:convert';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:pokedexx/screens/detail_screen.dart';
import 'package:pokedexx/screens/favorite_screen.dart';
import 'package:pokedexx/screens/setting_screen.dart';
import 'package:pokedexx/screens/welcome_screen.dart';
import 'package:pokedexx/widgets/poke_card.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json";
  List pokeList = [];
  List pokeListForDisplay = [];
  bool _isLoading = true;

  Color? _getColorForType(String type) {
    switch (type) {
      case 'Grass':
        return Colors.green[300];
      case 'Fire':
        return Colors.deepOrange[300];
      case 'Water':
        return Colors.blue[300];
      case 'Electric':
        return Colors.yellow[300];
      case 'Rock':
        return Colors.grey[600];
      case 'Normal': // Assuming Normal should also be grey
        return Colors.teal.shade100;
      case 'Ground':
        return Colors.brown[300];
      case 'Psychic':
        return Colors.indigo[300];
      case 'Fighting':
        return Colors.orange[300];
      case 'Bug':
        return Colors.lightGreen[300];
      case 'Ghost':
        return Colors.deepPurple[300];
      case 'Poison':
        return Colors.purple[300];
      default:
        return Colors.grey[300]; // Default color
    }
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
      pokeListForDisplay = pokeList;
    }
  }

  @override
  Widget build(BuildContext context) {
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
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
                child: Lottie.asset('assets/lottie/drawer.json'),
              ),
              ListTile(
                title: Text(
                  'Favorite',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                leading: Icon(
                  Icons.favorite,
                  size: 30,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => FavoriteScreen()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                leading: Icon(
                  Icons.settings,
                  size: 30,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SettingScreen()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                leading: Icon(
                  Icons.logout,
                  size: 30,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => WelcomeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search Pokemon...',
                  hintText: 'Enter name of Pokemon',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  icon: Icon(
                    Icons.catching_pokemon_sharp,
                    size: 65,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  suffixIcon: Icon(Icons.search_sharp, size: 40),
                ),
                onChanged: (text) {
                  text = text.toLowerCase();
                  setState(() {
                    pokeListForDisplay = pokeList.where((element) {
                      var name = element['name'].toString().toLowerCase();
                      return name.contains(text);
                    }).toList();
                  });
                },
              ),
            ),
            Expanded(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.yellow),
                    )
                  : pokeList.isEmpty
                  ? Center(
                      child: Text(
                        'No Pokemon found',
                        style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: pokeListForDisplay.length,
                      itemBuilder: (context, index) {
                        if (index >= pokeList.length) {
                          return SizedBox.shrink();
                        }
                        final pokemon =
                            pokeList[index]; // Get current pokemon by index
                        List<String> types = [];
                        if (pokemon['type'] != null &&
                            pokemon['type'] is List) {
                          types = (pokemon['type'] as List)
                              .map((t) => t.toString())
                              .toList();
                        }
                        return PokeCard(
                          pokeName: pokeListForDisplay[index]['name'] ?? "N/A",
                          pokeType: types.toString(),
                          pokeImage: CachedNetworkImage(
                            imageUrl: pokeListForDisplay[index]['img'] ?? "",
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                                color: Colors.grey,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error, color: Colors.red),
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                          bgColor: _getColorForType(
                            pokeListForDisplay[index]['type'][0],
                          ),
                          Tap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailScreen(
                                  pokeImage: CachedNetworkImage(
                                    imageUrl:
                                        pokeListForDisplay[index]['img'] ?? "",
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error, color: Colors.red),
                                    height: 200,
                                    fit: BoxFit.fill,
                                  ),
                                  pokeName:
                                      pokeListForDisplay[index]['name'] ??
                                      "N/A",
                                  pokeType: types.toString(),
                                  bgColor: _getColorForType(
                                    pokeListForDisplay[index]['type'][0],
                                  ),
                                  tag: index,
                                  pokeDetail: pokeListForDisplay[index],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void fetchPokemonData() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });
    try {
      var url = Uri.https(
        'raw.githubusercontent.com',
        '/Biuni/PokemonGo-Pokedex/master/pokedex.json',
      );
      http.Response value = await http.get(url); // Use await
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        if (mounted) {
          // Check mounted again before calling setState
          setState(() {
            pokeList =
                decodedJsonData['pokemon'] ??
                []; // Handle if 'pokemon' key is missing
            pokeListForDisplay = List.from(pokeList);
            _isLoading = false; // Set loading false after data is fetched
          });
        }
      } else {
        // Handle error status codes (e.g., show an error message)
        if (mounted) {
          setState(() {
            _isLoading = false;
            // Optionally, set an error message to display
          });
        }
        print("Failed to load Pokemon data. Status code: ${value.statusCode}");
      }
    } catch (e) {
      // Handle any other errors during the fetch (network issues, parsing errors)
      if (mounted) {
        setState(() {
          _isLoading = false;
          // Optionally, set an error message to display
        });
      }
      print("Error fetching Pokemon data: $e");
    }
  }
}
