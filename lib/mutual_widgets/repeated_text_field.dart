import 'package:egypttour/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RepeatedTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool hide;
  TextInputType? keyboardType;
  var icon;
  RepeatedTextFormField(
      {super.key,
      this.keyboardType,
      required this.hintText,
      required this.controller,
      this.icon,
      required this.hide});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: hide,
      controller: controller,
      style: const TextStyle(color: ColorsManager.primaryColor), // Set text color to black
      decoration: InputDecoration(
        prefixIcon: icon,
        contentPadding: const EdgeInsets.all(17),
        hintText: hintText,
        hintStyle: GoogleFonts.sora(
          color: ColorsManager.primaryColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ColorsManager.darkGrey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: ColorsManager.primaryColor, width: 1),
        ),
      ),
    );
  }
}
