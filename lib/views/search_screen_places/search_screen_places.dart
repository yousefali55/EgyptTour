import 'package:egypttour/views/home_screen/data/place_model.dart';
import 'package:flutter/material.dart';
import 'package:egypttour/views/place_screen/place_screen.dart';
class SearchScreenPlaces extends StatefulWidget {
  final List<Place> places;
  final String endpoint;
  final String weatherEndPoint;

  const SearchScreenPlaces(
      {Key? key,
      required this.places,
      required this.endpoint,
      required this.weatherEndPoint})
      : super(key: key);

  @override
  _SearchScreenPlacesState createState() => _SearchScreenPlacesState();
}

class _SearchScreenPlacesState extends State<SearchScreenPlaces> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredPlaces = searchText.isEmpty
        ? widget.places
        : widget.places
            .where((place) =>
                place.name!.toLowerCase().contains(searchText.toLowerCase()))
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredPlaces.length,
        itemBuilder: (context, index) {
          final place = filteredPlaces[index];
          return ListTile(
            title: Text(place.name!),
            subtitle: Text(place.description!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlaceScreen(
                    time: place.time,
                    placeLocation: place.location!,
                    placeNameText: place.name!,
                    placeDescription: place.description!,
                    img: place.img!,
                    rating: place.rate!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
