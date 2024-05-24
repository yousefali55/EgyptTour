import 'package:egypttour/spacing/spacing.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                heightSpace(10),
                Text(
                  'Welcome to the Help Centre',
                  style: GoogleFonts.cairo(
                    fontSize: 25,
                    color: ColorsManager.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                heightSpace(5),
                Text(
                  'We are available 24 hours a day',
                  style: GoogleFonts.cairo(
                    color: ColorsManager.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Frequently asked questions',
                  style: GoogleFonts.cairo(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.primaryColor,
                  ),
                ),
                ExpansionTileCard(
                  title: Text(
                    'Safety: Is Egypt safe to visit? What are the safety measures taken by the government and the Ministry of Tourism to ensure the safety of tourists?',
                    style: GoogleFonts.cairo(
                      height: 1.5,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  children: [
                    Text(
                      'Egypt is generally safe to visit, with low crime rates and enhanced safety measures in place at major tourist attractions such as the Pyramids of Giza, Luxor, and Aswan. The Egyptian government and tourism industry have implemented significant safety measures to protect visitors. These measures include armed guards, metal detectors, and bag checks at major attractions.'
                      'Even with these precautions, it is advisable to stay vigilant in crowded places, keep track of your belongings, and respect local customs and laws. The Foreign, Commonwealth & Development Office (FCDO) lists popular tourist destinations like Aswan, Luxor, Valley of the Kings, and Giza as safe for tourists, indicating a generally low risk of unexpected events.'
                      'However, it\'s recommended to stay informed about local news, avoid crowded areas when possible, and consider joining small group tours for added safety. This is especially relevant when visiting religious sites or during public holidays, when protests or civil unrest might occur.'
                      'Additionally, maintaining good health while visiting Egypt is crucial. Be aware of any health advisories or disease outbreaks in the regions you plan to visit. Protect yourself from the sun\'s intense rays, stay hydrated, and consider vaccinations or booster shots before your trip.',
                      style: GoogleFonts.cairo(
                        height: 1.5,
                        color: ColorsManager.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                heightSpace(10),
                ExpansionTileCard(
                  title: Text(
                    'Visa: Do I need a visa to visit Egypt? How can I obtain a visa, and what are the requirements for obtaining one?',
                    style: GoogleFonts.cairo(
                      height: 1.5,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  children: [
                    Text(
                      'To visit Egypt, you will need a valid passport with at least six months remaining validity from the date of entry. Depending on your nationality, you may also need a tourist visa. Citizens from certain countries, including the USA, the UK, all EU states, New Zealand, Australia, and Canada, among others, are able to obtain a visa on arrival in Egypt. Those who aren\'t able to enter Egypt visa-free or obtain a visa on arrival will need to apply for their Egyptian visa ahead of time. Nationals of certain countries are eligible to apply for a visa online (known as an eVisa), while others will have to apply in person at their nearest Egyptian consulate,The Egypt eVisa is an online visa issued for the purpose of tourism or business and allows the holder to stay for up to 30 days. The application is completed and submitted online, and the e-visa is delivered directly to your email address. The application fee can be paid by credit or debit card. If you plan to stay in Egypt for longer than 90 days, you will need a residence visa. This permit is also needed to work or study in the country. Once obtained, residence visas are renewable and issued with a validity of up to five years. After 10 years of continuous residence in Egypt, expats are entitled to apply for citizenship.To apply for an Egypt visa, you will need to complete an application form, provide a recent passport-size photo, and submit your passport. You may also need to provide additional documents, such as a letter of invitation from a host or company/organization in Egypt, hotel reservations, or a travel itinerary. It is important to note that the exact requirements and application process may vary depending on your nationality and the type of visa you are applying for. It is recommended to check the instructions and requirements provided by the Egyptian embassy or consulate in your country or the official Egyptian eVisa website for the most up-to-date and accurate information.',
                      style: GoogleFonts.cairo(
                        height: 1.5,
                        color: ColorsManager.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                heightSpace(10),
                ExpansionTileCard(
                  title: Text(
                    'Cost: How much does a trip to Egypt cost? What are the factors that affect the cost of a trip to Egypt?',
                    style: GoogleFonts.cairo(
                      height: 1.5,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  children: [
                    Text(
                      'The cost of a trip to Egypt can vary greatly depending on several factors, including the length of your stay, the time of year you travel, your budget, and the activities you want to do. A budget trip to Egypt can cost from \$470 to \$1770 per person, while a high-end luxury trip can range from \$1230 to \$2500 per person. The duration of your trip can have a significant impact on the cost of your trip to Egypt. The longer you stay, the more you will spend on accommodations, transportation, meals, and activities. For example, a 4-day trip to Cairo can start from \$470, while a 15-day Egypt tour can start from \$1820.The time of year you travel can also affect the cost of your trip to Egypt. The best time to visit Egypt is during the winter months from November to April when the weather is wonderful, but prices for flights, accommodations, and guides during this time are higher due to high demand . If you are willing to visit Egypt during the shoulder seasons of autumn, you can find more affordable prices while still enjoying good weather and fewer crowds.The number of travelers can also affect the cost of your trip to Egypt. Group discounts are available for larger parties, and transportation expenses such as flights or tour buses can be more effective when split among many travelers. The prices for accommodations can vary based on the time of year, category, and availability. Prices are higher during the peak season, and it is recommended to book in advance to secure the best rates',
                      style: GoogleFonts.cairo(
                        height: 1.5,
                        color: ColorsManager.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                heightSpace(10),
                ExpansionTileCard(
                  title: Text(
                    'Cultural tours: What are the most sought-after cultural tours in Egypt? What are the must-visit cities and attractions for cultural tours?',
                    style: GoogleFonts.cairo(
                      height: 1.5,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  children: [
                    Text(
                      'Cairo: The capital city of Egypt, Cairo is home to some of the most famous cultural attractions in the country, including the Pyramids of Giza, the Sphinx, and the Egyptian Museum, which houses the world\'s largest collection of ancient Egyptian artifacts.\n\n'
                      'Luxor: Known as the "world\'s greatest open-air museum," Luxor is home to a vast number of ancient temples and tombs, including the Valley of the Kings, the Temple of Karnak, and the Temple of Hatshepsut.\n\n'
                      'Aswan: Located in southern Egypt, Aswan is known for its stunning temples, including the Temple of Philae and the Temple of Abu Simbel, which are both situated on the shores of Lake Nasser.\n\n'
                      'Alexandria: Founded by Alexander the Great in 331 BC, Alexandria was once the center of the ancient world\'s knowledge and culture. Today, it is home to the Bibliotheca Alexandrina, a modern library and cultural center that honors the city\'s rich history.',
                      style: GoogleFonts.cairo(
                        height: 1.5, // Spacing between lines
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                heightSpace(10),
                ExpansionTileCard(
                  title: Text(
                    'Food: What are the traditional Egyptian dishes that I should try during my trip? What are the best restaurants and food stalls to try these dishes?',
                    style: GoogleFonts.cairo(
                      height: 1.5,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  children: [
                    Text(
                      'During your trip to Egypt, you should try traditional Egyptian dishes such as Fatta, Koshari, Bamia, Sayadeya, Moussaka, Molokhia, Ful Medames, Ta\'meya (Egyptian Falafel), Alexandrian Liver and Sausages, Kebab & Kofta, and Besarah. These dishes are made with local fruits, vegetables, legumes, and spices grown in the Nile Valley and the Delta. You can find most of the country\'s authentic, traditional foods in Cairo, where you can go on a food tour to try many of these dishes. Some of the best places to try these dishes are local restaurants, street food stalls, and international hotels. You can also find a variety of international cuisines in areas such as Zamalek, New Cairo, and October 6.',
                      style: GoogleFonts.cairo(
                        height: 1.5, // Spacing between lines
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                heightSpace(10),
                ExpansionTileCard(
                  title: Text(
                    'Budget: What are the best budget Egypt tours on the market? How can I get the best value and exceptional service for my money?',
                    style: GoogleFonts.cairo(
                      height: 1.5,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  children: [
                    Text(
                      'The best budget Egypt tours on the market include those offered by Budget Egypt Tours, Egypt Direct Tours, Your Egypt Tours, Egypt Tours Portal, Travel EG Egypt Tours and Holidays, Egypt Trip Guides, and Egypt Time Travel. These tour operators offer a range of affordable tour packages that provide excellent value for money, with experienced guides, comfortable accommodations, and a variety of cultural and historical experiences. To get the best value and exceptional service for your money, consider booking a tour package that includes a mix of guided tours, free time for exploration, and opportunities to try local food and activities. Look for tour operators that have positive reviews and a reputation for excellent customer service. When comparing tour packages, consider the inclusions and exclusions, such as meals, transportation, and entrance fees, to ensure that you are getting the best value for your money. It may also be helpful to read reviews from past customers to get an idea of the quality of service and overall experience. When traveling on a budget, it\'s important to be mindful of your spending and to plan ahead for any additional expenses, such as meals and souvenirs. Consider bringing cash for small purchases and using an ATM to withdraw local currency, as credit card fees can add up quickly.',
                      style: GoogleFonts.cairo(
                        height: 1.5, // Spacing between lines
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                heightSpace(10),
                ExpansionTileCard(
                  title: Text(
                    'Travel tips: What are the essential questions and answers about Egypt that I should know before my trip? What are the helpful travel tips and cultural gems that I should be aware of?',
                    style: GoogleFonts.cairo(
                      height: 1.5,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  children: [
                    Text(
                      'Before your trip to Egypt, it\'s essential to know some questions and answers about the country, such as the official currency being the Egyptian pound, and that tipping is customary. It\'s also important to be aware of health concerns, such as avoiding tap water and being careful in the sun. In terms of cultural gems, it\'s worth noting that Cairo\'s Pyramid hotels offer a different experience than downtown hotels, with outdoor pools and comfortable areas, and that traffic from the city center to the pyramids can take over an hour. When it comes to food, traditional Egyptian dishes such as Kushari, Mulukhiya, Fatta, Sayadeya, Ful Medames, Ta\'meya (Egyptian Falafel), Alexandrian Liver and Sausages, Kebab & Kofta, and Besarah are must-tries. These dishes can be found in local restaurants, street food stalls, and international hotels. For budget travelers, there are several Egypt tour packages available that offer excellent value for money, with experienced guides, comfortable accommodations, and a variety of cultural and historical experiences. These packages can range from 499 USD and up, and can be customized to fit your preferences and budget. When it comes to transportation, taxis are widely available and are the fastest and most common way to get around Cairo. However, it\'s advisable to avoid old black cabs and negotiate the price with new white taxis. Bus travel is also available, and there are many transportation options available from Cairo Airport. Finally, it\'s worth noting that Egypt is a big country with a wonderful civilization and always welcomes its amazing travelers at any time. The best time to travel to Egypt is during the winter from September to April as the climate becomes a bit tropical. However, it\'s important to stay informed about the tourism environment and any updates regarding safety.',
                      style: GoogleFonts.cairo(
                        height: 1.5, // Spacing between lines
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                heightSpace(10),
                ExpansionTileCard(
                  title: Text(
                    'Who we are?',
                    style: GoogleFonts.cairo(
                      height: 1.5,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  children: [
                    Text(
                      'Egyptour is the inaugural Egyptian online platform dedicated to uncovering the rich tapestry of archaeological and tourist sites across Egypt.',
                      style: GoogleFonts.cairo(
                        height: 1.5,
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                heightSpace(10),
                ExpansionTileCard(
                  title: Text(
                    'What we do?',
                    style: GoogleFonts.cairo(
                      height: 1.5,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  children: [
                    Text(
                      'We provide a superior user experience and a wide array of options encompassing tourist destinations, antiquities, hotels, and restaurants around Egypt to cater to your individual preference',
                      style: GoogleFonts.cairo(
                        height: 1.5,
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                heightSpace(10),
                ExpansionTileCard(
                  title: Text(
                    'Does our company take any fees?',
                    style: GoogleFonts.cairo(
                      height: 1.5,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  children: [
                    Text(
                      'We don’t charge you any fees or add any administrative charges. And in many cases, your browsing and subscribing can be free of charge.',
                      style: GoogleFonts.cairo(
                        height: 1.5,
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                heightSpace(10),
                ExpansionTileCard(
                  title: Text(
                    'Does our company own an app?',
                    style: GoogleFonts.cairo(
                      height: 1.5,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  children: [
                    Text(
                      'Yes, we have a mobile application and we advice you to download our app to get a better experience',
                      style: GoogleFonts.cairo(
                        height: 1.5,
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                heightSpace(30),
                Text(
                  'Become VIP',
                  style: GoogleFonts.cairo(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.primaryColor,
                  ),
                ),
                heightSpace(5),
                Text(
                  'Enjoy priority access to new products, services, and events before they are made available to the general public.',
                  style: GoogleFonts.cairo(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                heightSpace(10),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.primaryColor,
                    ),
                    child: Text(
                      'Upgrade now!',
                      style: GoogleFonts.cairo(
                        color: ColorsManager.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
