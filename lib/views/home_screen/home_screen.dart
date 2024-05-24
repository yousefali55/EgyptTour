import 'package:easy_localization/easy_localization.dart';
import 'package:egypttour/views/floating_action/city_text_and_endpoint_model.dart';
import 'package:flutter/material.dart';
import 'package:egypttour/views/home_screen/widgets/city_container.dart';
import 'package:egypttour/spacing/spacing.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imageAssets;
  final List<CityModel> cities;

  const HomeScreen({super.key, 
    required this.imageAssets,
    required this.cities,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                    child: Image.asset('assets/images/tourist.png'),
                  ),
                  Text(
                    'Welcome, Browse our journey'.tr(),
                    style: GoogleFonts.sora(
                      color: ColorsManager.primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 550.h,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: imageAssets.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CityContainer(
                          imageAsset: imageAssets[index],
                          cityText: cities[index].cityText,
                          endPoint: cities[index].endpoint,
                        );
                      },
                    ),
                  ),
                  Text(
                    'news'.tr(),
                    style: GoogleFonts.sora(
                      color: ColorsManager.primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  heightSpace(20),
                  Text(
                    "newss".tr(),
                    style: const TextStyle(
                      fontSize: 19,
                      color: ColorsManager.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
