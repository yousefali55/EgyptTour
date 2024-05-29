import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egypttour/views/floating_action/city_text_and_endpoint_model.dart';
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
                  style: const TextStyle(
                      color: Color(0xffc39126),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 16, bottom: 15),
                  child: Text(
                    "what's new".tr(),
                    style:
                        const TextStyle(fontSize: 24, color: Color(0xffc39126)),
                  ),
                ),
                SlideShow(
                    imageAssets: imageAssets), 
                Text(
                  'newss'.tr(),
                  style:
                      const TextStyle(fontSize: 19, color: Color(0xffc39126)),
                ),
                heightSpace(20),
                SizedBox(
                  height: 1000.h,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
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

class SlideShow extends StatefulWidget {
  final List<String> imageAssets;

  const SlideShow({
    Key? key,
    required this.imageAssets,
  }) : super(key: key);

  @override
  _SlideShowState createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Adjust the height of the slideshow as needed
      child: PageView(
        controller: _controller,
        children: widget.imageAssets.map((imageAsset) {
          return Container(
            width: MediaQuery.of(context).size.width, // Match parent width
            child: Image.asset(
              imageAsset,
              fit: BoxFit.cover, // Ensure the image covers the container
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
