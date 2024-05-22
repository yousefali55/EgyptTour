import 'package:egypttour/spacing/spacing.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceScreen extends StatelessWidget {
  final String placeNameText;
  final String placeDescription;
  const PlaceScreen(
      {super.key, required this.placeNameText, required this.placeDescription});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              placeNameText,
              style: GoogleFonts.sora(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorsManager.primaryColor,
              ),
            ),
            heightSpace(30),
            Text(placeDescription,
            style: GoogleFonts.sora(
              color: ColorsManager.primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 17
            ),),
          ],
        ),
      ),
    ));
  }
}
