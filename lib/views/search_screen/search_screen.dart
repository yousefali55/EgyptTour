import 'package:egypttour/views/city_screen/city_screen.dart';
import 'package:egypttour/views/floating_action/city_text_and_endpoint_model.dart';
import 'package:egypttour/views/home_screen/data/cubit/city_informations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  final List<CityModel> cities;
  // final List<String> endPoints;

  const SearchScreen({super.key, required this.cities});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    List<CityModel> filteredCities = widget.cities
        .where((city) =>
            city.cityText.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: (value) => setState(() => searchText = value),
            decoration: const InputDecoration(
              hintText: 'Search Cities...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: filteredCities.length,
          itemBuilder: (context, index) {
            final city = filteredCities[index]; // Get the CityModel directly
            return ListTile(
              title: Text(city.cityText),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (context) => CityInformationsCubit(city.endpoint)..fetchPlaces(),
                      child: const CityScreen(),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
