import 'package:egypttour/theming/colors_manager.dart';
import 'package:egypttour/views/home_screen/data/cubit/city_informations_cubit.dart';
import 'package:egypttour/views/home_screen/data/place_model.dart';
import 'package:egypttour/views/place_screen/place_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CityInformationsCubit, CityInformationsState>(
        builder: (context, state) {
          if (state is CityInformationsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CityInformationsSuccess) {
    print('Elyoooooooooooooooooooooooooooo');
            var places = state.governorate;
            return ListView(
              children: [
                buildCategory('Hotels', places.hotels),
                buildCategory('Restaurants', places.restaurants),
                buildCategory('Museums', places.museums),
                buildCategory('Historical Sites', places.historicalSites),
              ],
            );
          } else if (state is CityInformationsFailure) {
            return Center(child: Text(state.errorMessge));
          }
          return Container(); // Default state
        },
      ),
    );
  }

  Widget buildCategory(String categoryName, List<Place> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              categoryName,
              style: GoogleFonts.sora(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: ColorsManager.primaryColor,
              ),
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlaceScreen(
                      placeNameText: item.name ?? 'none',
                      placeDescription: item.description ?? 'none',
                    ),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name ?? 'Name Unavailable',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            item.description ?? 'No Description',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow[700]),
                              Text(item.rate ?? 'N/A'),
                              const Spacer(),
                              Text(item.number ?? 'N/A'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
