import 'package:egypttour/spacing/spacing.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:egypttour/views/city_screen/city_screen.dart';
import 'package:egypttour/views/home_screen/data/cubit/city_informations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CityContainer extends StatelessWidget {
  final String imageAsset;
  final String cityText;
  final String endPoint;
  const CityContainer(
      {super.key,
      required this.imageAsset,
      required this.cityText,
      required this.endPoint});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CityInformationsCubit(endPoint),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) =>
                        CityInformationsCubit(endPoint)
                          ..fetchPlaces(), // Pass the endPoint
                    child: const CityScreen(),
                  ),
                ),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: ColorsManager.primaryColor),
              height: 210.h,
              width: 160.w,
              child: Column(
                children: [
                  heightSpace(10),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 100.h,
                      width: 140.w,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
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
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
