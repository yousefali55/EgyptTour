import 'package:flutter/material.dart';
import 'package:egypttour/views/favourites_screen/data/favourites_model.dart';
import 'package:egypttour/views/favourites_screen/data/favourites_shared.dart';
import 'package:egypttour/views/home_screen/data/place_model.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  List<Place> favoritePlaces = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  void loadFavorites() async {
    List<FavoritePlace> favorites = await FavoriteStorage.getFavorites();
    setState(() {
      favoritePlaces = favorites
          .map((fav) => Place(
                time: [],
                id: fav.id,
                name: fav.name,
                description: fav.description,
                img: fav.imageUrl,
              ))
          .toList();
    });
  }

  void removeFavorite(String id) async {
    await FavoriteStorage.removeFavorite(id);
    loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (context, index) {
          final place = favoritePlaces[index];
          return ListTile(
            title: Text(place.name!),
            subtitle: Text(place.description!),
            leading: Image.network('https://docs.google.com/uc?id=${extractDriveId(place.img!)}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                removeFavorite(place.id!);
              },
            ),
          );
        },
      ),
    );
  }

  String extractDriveId(String url) {
    try {
      Uri uri = Uri.parse(url);
      String? id = uri.queryParameters['id'];
      if (id != null && id.isNotEmpty) {
        return id;
      }
      RegExp regExp =
          RegExp(r'^https:\/\/drive\.google\.com\/file\/d\/([^\/]+)\/?.*$');
      Match? match = regExp.firstMatch(url);
      if (match != null && match.groupCount > 0) {
        return match.group(1) ?? '';
      }

      return '';
    } catch (e) {
      return '';
    }
  }
}
//             leading: Image.network('https://docs.google.com/uc?id=${extractDriveId(place.img!)}'),
