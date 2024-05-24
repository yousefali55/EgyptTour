import 'package:egypttour/spacing/spacing.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AboutView extends StatelessWidget {
  final List<String> images = [
    'assets/images/Rectangle173.png',
    'assets/images/Rectangle174.png',
    'assets/images/Rectangle175.png',
    'assets/images/Rectangle176.png',
    'assets/images/Rectangle177.png',
    'assets/images/Rectangle178.png',
  ];

  AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'About Egyptour.com',
                      style: GoogleFonts.cairo(
                        color: ColorsManager.primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    heightSpace(10),
                    Text(
                      'Egyptour stands out as a groundbreaking initiative, spearheaded by a passionate group of university students who are deeply committed to promoting Egypt\'s cultural treasures and fostering domestic tourism. This innovative project, which debuted in the latter half of 2024, serves as a digital gateway to Egypt\'s myriad archaeological and tourist sites. By offering detailed insights, precise directions, and captivating visuals of each destination, Egyptour aims to captivate a wide audience, including young individuals, tourists, and visitors, with the allure of Egypt\'s historical marvels. The core mission of Egyptour is twofold: to showcase the beauty and historical significance of Egypt while also contributing to the country\'s economic prosperity through the promotion of domestic tourism. By highlighting the splendor of Egypt\'s landscapes, monuments, and people, the platform endeavors to instill a sense of appreciation and wonder in its users. Moreover, by providing customer service round-the-clock, Egyptour ensures that users have continuous support and guidance as they explore the diverse offerings of the website. In essence, Egyptour represents a dynamic platform that not only celebrates Egypt\'s rich heritage but also serves as a catalyst for sustainable tourism growth and economic development. Through its user-friendly interface, comprehensive information, and unwavering commitment to customer service, Egyptour is poised to become a premier destination for individuals seeking to immerse themselves in the wonders of Egypt.',
                      style: GoogleFonts.cairo(
                        height: 1.5,
                        color: ColorsManager.navyBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              heightSpace(20),
              Text(
                'What Egyptour.com offers',
                style: GoogleFonts.cairo(
                  color: ColorsManager.navyBlue,
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                ),
              ),
              heightSpace(7),
              Text(
                'Incredible experience',
                style: GoogleFonts.cairo(
                  color: ColorsManager.navyBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              heightSpace(5),
              Text(
                'We provide a superior user experience and a wide array of options encompassing tourist destinations, antiquities, hotels, and restaurants to cater to your individual preference.',
                style: GoogleFonts.cairo(
                  color: ColorsManager.navyBlue,
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  // إنشاء GridView بعناصر محددة
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              Text(
                'We provide a superior user experience and a wide array of options encompassing tourist destinations, antiquities, hotels, and restaurants to cater to your individual preference',
                style: GoogleFonts.cairo(
                  height: 2,
                  color: ColorsManager.navyBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
              heightSpace(5),
              Text(
                'No fees',
                style: GoogleFonts.cairo(
                  color: ColorsManager.navyBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'We don’t charge you any fees or add any administrative charges. And in many cases, your browsing and subscribing can be free of charge.',
                style: GoogleFonts.cairo(
                  height: 2,
                  color: ColorsManager.navyBlue,
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
              Text(
                '24/7 support',
                style: GoogleFonts.cairo(
                  color: ColorsManager.navyBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Our customer experience team are on hand around the clock to answer your questions and advocate on your behalf in more than 40 languages.',
                style: GoogleFonts.cairo(
                  height: 2,
                  color: ColorsManager.navyBlue,
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
              Text(
                'Constant evolution',
                style: GoogleFonts.cairo(
                  height: 2,
                  color: ColorsManager.navyBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'We strive to deliver an exceptional promotional service for our company, continually prioritizing the enhancement of user experience and providing comprehensive, limitless services to our valued users, both domestically and internationally.',
                style: GoogleFonts.cairo(
                  height: 2,
                  color: ColorsManager.navyBlue,
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
              heightSpace(5),
            ],
          ),
        ),
      ),
    );
  }
}
