import 'package:easy_localization/easy_localization.dart';
import 'package:egypttour/mutual_widgets/custom_snack_bar.dart';
import 'package:egypttour/mutual_widgets/repeated_text_field.dart';
import 'package:egypttour/mutual_widgets/two_buttons_in_two_screens.dart';
import 'package:egypttour/spacing/spacing.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:egypttour/views/profile_related_screens/general_information/data/cubit/edit_user_info_cubit.dart';
import 'package:egypttour/views/profile_related_screens/profile/data/cubit/get_user_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralInFormation extends StatelessWidget {
  // List<String> textfields = [
  //   'Name',
  //   'Change E-mail address',
  //   'Gender',
  //   'Location',
  //   'Phone number',
  //   'Nationality',
  //   'Birth of date',
  //   'Website URL',
  //   'Company',
  //   'Other Website',
  // ];
  GeneralInFormation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => GetUserInformationCubit()..fetchUserInfo(),
        child: BlocBuilder<GetUserInformationCubit, GetUserInformationState>(
          builder: (context, state) {
            if (state is GetUserInformationLoading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.primaryColor,
                  ),
                ),
              );
            }
            if (state is GetUserInformationSuccess) {
              final userInfo = state.userInfo;
              return BlocProvider(
                create: (context) => EditUserInfoCubit(),
                child: Scaffold(
                  body: BlocBuilder<EditUserInfoCubit, EditUserInfoState>(
                    builder: (context, state) {
                      if (state is EditUserInfoSuccess) {
                        showCustomSnackbar(context, 'Success'.tr(),
                            ColorsManager.primaryColor);
                            Navigator.pop(context);
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          heightSpace(20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 137,
                                  width: 137,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        // ignore: unnecessary_type_check
                                        state is GetUserInformationSuccess
                                            ? NetworkImage(userInfo.avatar[0])
                                            : AssetImage(
                                                'assets/images/person.jpg'),
                                    radius: 364,
                                  ),
                                ),
                                widthSpace(20),
                                Text(
                                  'Personal details and Adresses'.tr(),
                                  style: GoogleFonts.montserrat(
                                    color: ColorsManager.primaryColor,
                                    fontSize: 23,
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
                                  onPressed: () {
                                    context
                                        .read<EditUserInfoCubit>()
                                        .pickImage();
                                  },
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                RepeatedTextFormField(
                                  controller: TextEditingController(),
                                  hintText: "Full name".tr(),
                                  hide: false,
                                ),
                                // ),
                                // RepeatedTextFormField(
                                //   controller: TextEditingController(),
                                //   hintText: "Email".tr(),
                                //   hide: false,
                                // ),
                                // RepeatedTextFormField(
                                //   controller: TextEditingController(),
                                //   hintText: "Full name".tr(),
                                //   hide: false,
                                // ),
                                // RepeatedTextFormField(
                                //   controller: TextEditingController(),
                                //   hintText: "Full name".tr(),
                                //   hide: false,
                                // ),
                                // RepeatedTextFormField(
                                //   controller: TextEditingController(),
                                //   hintText: "Full name".tr(),
                                //   hide: false,
                                // ),
                              ],
                            ),
                          ),
                          // Expanded(
                          //   child: ListView.builder(
                          //     itemCount: textfields.length,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       return CustomTextFormField(text: textfields[index]);
                          //     },
                          //   ),
                          // ),
                          TwoButtonsInTwoScreens(
                            onPressedSaved: 
                                context.read<EditUserInfoCubit>().editUserInfo,
                            onPressedDiscared: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    },
                  ),
                ),
              );
            } else if (state is GetUserInformationFailure) {
              return Text(state.errorMessage);
            } else {
              return Scaffold(body: Container());
            }
          },
        ),
      ),
    );
  }
}
