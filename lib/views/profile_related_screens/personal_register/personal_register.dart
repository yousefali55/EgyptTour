import 'package:egypttour/mutual_widgets/two_buttons_in_two_screens.dart';
import 'package:egypttour/spacing/spacing.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:egypttour/views/profile_related_screens/personal_register/widgets/custon_text_form_field.dart';
import 'package:egypttour/views/profile_related_screens/security/security.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonlaRegister extends StatelessWidget {
  List<String> textfields = [
    'Name',
    'Change E-mail address',
    'Gender',
    'Location',
    'Phone number',
    'Nationality',
    'Birth of date',
    'Website URL',
    'Company',
    'Other Website',
  ];
  PersonlaRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            heightSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const SizedBox(
                    height: 137,
                    width: 137,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/person.png'),
                      radius: 364,
                    ),
                  ),
                  widthSpace(20),
                  Text(
                    'Personal details \n and Adresses',
                    style: GoogleFonts.montserrat(
                      color: ColorsManager.primaryColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/replace.svg',
                  ),
                  TextButton(
                    style: const ButtonStyle(
                      visualDensity: VisualDensity.comfortable,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Replace',
                      style: GoogleFonts.changa(
                        fontSize: 16,
                        color: ColorsManager.navyBlue,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            heightSpace(15),
            const Divider(
              color: ColorsManager.navyBlue,
              height: 1,
            ),
            Text(
              'Basic Information',
              style: GoogleFonts.changa(
                fontSize: 20,
                color: ColorsManager.navyBlue,
                fontWeight: FontWeight.w400,
              ),
            ),
            heightSpace(10),
            Expanded(
              child: ListView.builder(
                itemCount: textfields.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomTextFormField(text: textfields[index]);
                },
              ),
            ),
            TwoButtonsInTwoScreens(
              onPressedDiscared: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SecurityScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
