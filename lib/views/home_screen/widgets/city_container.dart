import 'package:easy_localization/easy_localization.dart';
import 'package:egypttour/mutual_widgets/explore_button.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:egypttour/views/city_screen/city_screen.dart';
import 'package:egypttour/views/home_screen/data/cubit/city_informations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CityContainer extends StatelessWidget {
  final String imageAsset;
  final String cityText;
  final String endpointEn;
  final String weatherEndPoint;
  final String endpointAr;

  const CityContainer({
    super.key,
    required this.imageAsset,
    required this.cityText,
    required this.endpointEn,
    required this.weatherEndPoint,
    required this.endpointAr,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final endpoint = isArabic ? endpointAr : endpointEn;
    return BlocProvider(
      create: (context) => CityInformationsCubit(endpoint, weatherEndPoint)
        ..getWeather(), // Fetch weather data when CityContainer is created
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) =>
                      CityInformationsCubit(endpoint, weatherEndPoint)
                        ..fetchPlaces(),
                  child: const CityScreen(),
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorsManager.primaryColor,
            ),
            height: 300,
            width: 160,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 100,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  cityText,
                  style: GoogleFonts.sora(
                    color: ColorsManager.offWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                BlocBuilder<CityInformationsCubit, CityInformationsState>(
                  builder: (context, state) {
                    if (state is CityWeatherLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is CityWeatherFailure) {
                      print(state.errorMessge);
                      return Text(state.errorMessge);
                    } else if (state is CityWeatherSuccess) {
                      final weather = state.cityWeather;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${weather.current.tempC.toString()}°C',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${weather.current.tempF.toString()}°F',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Container(); // Default state
                  },
                ),
                const ExploreButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


