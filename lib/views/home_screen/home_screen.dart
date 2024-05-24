import 'package:easy_localization/easy_localization.dart';
import 'package:egypttour/views/floating_action/city_text_and_endpoint_model.dart';
import 'package:flutter/material.dart';
import 'package:egypttour/views/home_screen/widgets/city_container.dart';
import 'package:egypttour/spacing/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imageAssets;
  final List<CityModel> cities;

  const HomeScreen({
    super.key,
    required this.imageAssets,
    required this.cities,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Explore Egypt'.tr(),
                  style: TextStyle(
                      color: Color(0xffc39126),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 16, bottom: 15),
                  child: Text(
                    'What\'s new ?'.tr(),
                    style: TextStyle(fontSize: 24, color: Color(0xffc39126)),
                  ),
                ),
                Text(
                  'newss'.tr(),
                  style: const TextStyle(
                      fontSize: 19, color: Color.fromARGB(255, 95, 71, 20)),
                ),
                SizedBox(
                  height: 720.h,
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
                        endpointAr: cities[index].endpointAr,
                        endpointEn: cities[index].endpointEn,
                        weatherEndPoint: cities[index].weatherEndPoint,
                      );
                    },
                  ),
                ),
                heightSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
