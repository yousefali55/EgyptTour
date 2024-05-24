import 'package:easy_localization/easy_localization.dart';
import 'package:egypttour/changers/theme_changer/cubit/theme_changer_cubit.dart';
import 'package:egypttour/views/favourites_screen/favourites_screen.dart';
import 'package:egypttour/views/floating_action/city_text_and_endpoint_model.dart';
import 'package:egypttour/views/home_screen/home_screen.dart';
import 'package:egypttour/views/profile_screen/profile_screen.dart';
import 'package:egypttour/views/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingActionButtonScreen extends StatefulWidget {
  const FloatingActionButtonScreen({Key? key}) : super(key: key);

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
  List<CityModel> cities = [
    CityModel(
      cityText: 'Port Said'.tr(),
      endpoint: '6633d4c8823b68249b2ac122',
      arEndPoint: '',
    ),
    CityModel(
      cityText: 'Cairo'.tr(),
      endpoint: '6633d356823b68249b2abf5e',
      arEndPoint: '664d09b496363511224c13e2',
    ),
    CityModel(
      cityText: 'Fayoum'.tr(),
      endpoint: '6633d648823b68249b2ac1ee',
      arEndPoint: '664d0cd496363511224c1504',
    ),
    CityModel(
      cityText: 'Aswan'.tr(),
      endpoint: '',
      arEndPoint: '664a2e45d2481d0c0c8c9d90',
    ),
    CityModel(
      cityText: 'Alexandria'.tr(),
      endpoint: '6633d2a7823b68249b2abe5c',
      arEndPoint: '664c6857191fb4437fad6f53',
    ),
    CityModel(
      cityText: 'Luxor'.tr(),
      endpoint: '6633eb26823b68249b2ac2c8',
      arEndPoint: '664c67d9191fb4437fad6e81',
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
      drawer: Drawer(
        child: Column(
          children: [
            BlocBuilder<ThemeChangerCubit, ThemeChangerState>(
              builder: (context, state) {
                return SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: state is ThemeChangerChanged
                      ? state.isDarkModee ?? false
                      : false,
                  onChanged: (newValue) {
                    context.read<ThemeChangerCubit>().toggleTheme(newValue);
                  },
                );
              },
            ),
            // BlocBuilder<LanguageChangerCubit, LanguageChangerState>(
            //   builder: (context, state) {
            //     return SwitchListTile(
            //       title: Text('Arabic'),
            //       value: context.locale.languageCode == 'ar',
            //       onChanged: (newValue) {
            //         final newLocale = newValue
            //                   ? const Locale('ar', 'AR')
            //                 : const Locale('en', 'US');
            //         context
            //             .read<LanguageChangerCubit>()
            //             .switchLanguage(newLocale); // Emit new state from Cubit
            //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const FloatingActionButtonScreen()));
            //       },
            //     );
            //   },
            // ),
          ],
        ),
      ),
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
        selectedItemColor: const Color.fromARGB(255, 255, 249, 235), // Change with your desired color
        onTap: _onItemTapped,
      ),
    );
  }
}
