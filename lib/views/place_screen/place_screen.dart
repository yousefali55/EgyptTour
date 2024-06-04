import 'package:flutter/material.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:egypttour/views/home_screen/data/place_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceScreen extends StatelessWidget {
  final String placeNameText;
  final String placeDescription;
  final String img;
  final String rating;
  final List<TimeSlot>? time; // Add null safety for time
  final String placeLocation;

  const PlaceScreen({
    super.key, 
    required this.placeNameText,
    required this.placeDescription,
    required this.img,
    required this.rating,
    required this.time,
    required this.placeLocation,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 380.h,
                child: PanoramaViewer(
                  child: Image.network(
                    'https://docs.google.com/uc?id=${extractDriveId(img)}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          placeNameText.length > 25
                              ? placeNameText.substring(0, 25) + '...'
                              : placeNameText,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: ColorsManager.brown,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Rating: $rating',
                          style: const TextStyle(
                            color: ColorsManager.brown,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      placeDescription,
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 25.sp,
                        color: const Color.fromARGB(255, 117, 76, 14),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Image.asset('assets/images/Days to visit.png'),
                    SizedBox(height: 20.h),
                    if (time != null) ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            buildTimes(), // Call buildTimes only if time is not null
                      ),
                      SizedBox(height: 20.h),
                    ],
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.location_pin,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 25.0,
                      ),
                      onPressed: () {
                        launchMaps(placeLocation);
                      },
                      label: Text(
                        'Location.',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 117, 76, 14),
                          fontSize: 20.sp,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 246, 214, 144),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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

  List<Widget> buildTimes() {
    return time!.map((timeSlot) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${timeSlot.day}:',
              style: TextStyle(
                color: ColorsManager.brown,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8), // Add space between day and time slot
            Text(
              timeSlot.timeSlot,
              style: TextStyle(
                color: ColorsManager.brown,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Future<void> launchMaps(String location) async {
    String googleMapsUrl = Uri.encodeFull(location);

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}
