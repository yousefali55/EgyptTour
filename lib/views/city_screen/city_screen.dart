import 'package:easy_localization/easy_localization.dart';
import 'package:egypttour/views/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:egypttour/mutual_widgets/CustRowIcon.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:egypttour/views/home_screen/data/cubit/city_informations_cubit.dart';
import 'package:egypttour/views/home_screen/data/place_model.dart';
import 'package:egypttour/views/place_screen/place_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String _selectedCategory = 'Hotels';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CityInformationsCubit, CityInformationsState>(
        builder: (context, state) {
          if (state is CityInformationsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CityInformationsSuccess) {
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
    if (_selectedCategory != categoryName) {
      return SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 50,
            child: Image.asset(
              'assets/images/tourist.png',
            ),
          ),
        ),
         Padding(
          padding: EdgeInsets.only(top: 20, left: 16, bottom: 15),
          child: Text(
            'Categories'.tr(),
            style: TextStyle(fontSize: 24, color: Color(0xffc39126)),
          ),
        ),
        Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 9, right: 4)),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CUSTRowICON(
                image: 'assets/images/Historical Sites.png',
                text1: 'Historical \n Sites'.tr(),
                ontap: () {
                  setState(() {
                    _selectedCategory = 'Historical Sites';
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CUSTRowICON(
                image: 'assets/images/Museums.png',
                text1: 'Musems'.tr(),
                ontap: () {
                  setState(() {
                    _selectedCategory = 'Museums';
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CUSTRowICON(
                image: 'assets/images/Hotel.png',
                text1: 'Hotels'.tr(),
                ontap: () {
                  setState(() {
                    _selectedCategory = 'Hotels';
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CUSTRowICON(
                image: 'assets/images/Restaurants.png',
                text1: 'Restaurants'.tr(),
                ontap: () {
                  setState(() {
                    _selectedCategory = 'Restaurants';
                  });
                },
              ),
            ),
          ],
        ),
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
            childAspectRatio: 0.8,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final imageUrl = item.img!;
            final driveId = extractDriveId(imageUrl); // Extract the Drive ID
            print(
                'URL: $imageUrl, Drive ID: $driveId'); // Print the URL and extracted Drive ID
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlaceScreen(
                      placeLocation: item.location!,
                      time: item.time,
                      rating: item.rate!,
                      img: item.img!,
                      placeNameText: item.name ?? 'none',
                      placeDescription: item.description ?? 'none',
                    ),
                  ),
                );
              },
              child: Card(
                color: ColorsManager.brown,
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            child: Image.network(
                              'https://docs.google.com/uc?id=${extractDriveId(item.img!)}',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            item.name!,
                            style: GoogleFonts.sora(
                              color: ColorsManager.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow[700]),
                              Text(item.rate ?? 'N/A'),
                              const Spacer(),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: ColorsManager.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      'Explore'.tr(),
                                      style: GoogleFonts.sora(
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              )
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

  String extractDriveId(String url) {
    try {
      Uri uri = Uri.parse(url);

      // Check if the URL contains an 'id' query parameter
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
