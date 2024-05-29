import 'package:easy_localization/easy_localization.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreButton extends StatelessWidget {
  const ExploreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.h,
        width: 90.w,
        decoration: const BoxDecoration(
            color: ColorsManager.darkerWhite,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Explore'.tr(),
                style: GoogleFonts.sora(color: Colors.black),
              ),
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ));
  }
}
