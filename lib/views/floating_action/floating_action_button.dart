import 'package:easy_localization/easy_localization.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:egypttour/views/favourites_screen/favourites_screen.dart';
import 'package:egypttour/views/floating_action/city_text_and_endpoint_model.dart';
import 'package:egypttour/views/home_screen/home_screen.dart';
import 'package:egypttour/views/profile_screen/profile_screen.dart';
import 'package:egypttour/views/search_screen/search_screen.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonScreen extends StatefulWidget {
  const FloatingActionButtonScreen({super.key});

  @override
  State<FloatingActionButtonScreen> createState() =>
      _FloatingActionButtonScreenState();
}

class _FloatingActionButtonScreenState
    extends State<FloatingActionButtonScreen> {
  int _selectedIndex = 0;
  final List<String> imageAssets = [
    'assets/images/portSaid.jpg',
    'assets/images/Cairo.png',
    'assets/images/Fayoum.png',
    'assets/images/Aswan.png',
    'assets/images/Alexandria.png',
    'assets/images/Luxor.png',
  ];
  // final List<String> cityTexts = [
  //   'Port Said'.tr(),
  //   'Cairo'.tr(),
  //   'Fayoum'.tr(),
  //   'Aswan'.tr(),
  //   'Alexandria'.tr(),
  //   'Luxor'.tr()
  // ];
  // final List<String> endPoints = [
  //   '6633d4c8823b68249b2ac122',
  //   '6633d356823b68249b2abf5e',
  //   '6633d648823b68249b2ac1ee',
  //   '',
  //   '6633d2a7823b68249b2abe5c',
  //   '6633eb26823b68249b2ac2c8'
  // ];
  List<CityModel> cities = [
    CityModel(
      cityText: 'Port Said'.tr(),
      endpoint: '6633d4c8823b68249b2ac122',
    ),
    CityModel(
      cityText: 'Cairo'.tr(),
      endpoint: '6633d356823b68249b2abf5e',
    ),
    CityModel(
      cityText: 'Fayoum'.tr(),
      endpoint: '6633d648823b68249b2ac1ee',
    ),
    CityModel(
      cityText: 'Aswan'.tr(),
      endpoint: '',
    ),
    CityModel(
      cityText: 'Alexandria'.tr(),
      endpoint: '6633d2a7823b68249b2abe5c',
    ),
    CityModel(
      cityText: 'Luxor'.tr(),
      endpoint: '6633eb26823b68249b2ac2c8',
    ),
  ];

  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomeScreen(
        imageAssets: imageAssets,
        cities: cities,
      ),
      const FavouritesScreen(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SearchScreen(
                    cities: cities,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: 'Favourites'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile'.tr(),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorsManager.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
