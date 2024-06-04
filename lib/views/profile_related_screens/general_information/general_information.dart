import 'package:easy_localization/easy_localization.dart';
import 'package:egypttour/mutual_widgets/custom_snack_bar.dart';
import 'package:egypttour/mutual_widgets/elevated_button_for_sign_in_up.dart';
import 'package:egypttour/mutual_widgets/repeated_text_field.dart';
import 'package:egypttour/mutual_widgets/two_buttons_in_two_screens.dart';
import 'package:egypttour/spacing/spacing.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:egypttour/views/profile_related_screens/general_information/data/cubit/edit_user_info_cubit.dart';
import 'package:egypttour/views/profile_related_screens/profile/data/cubit/get_user_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralInFormation extends StatelessWidget {
  const GeneralInFormation({Key? key}) : super(key: key);

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          heightSpace(20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                // SizedBox(
                                //   height: 137,
                                //   width: 137,
                                //   child: CircleAvatar(
                                //     backgroundImage: userInfo.avatar != null &&
                                //             userInfo.!.isNotEmpty
                                //         ? NetworkImage(userInfo.avatar![0])
                                //         : const AssetImage(
                                //                 'assets/images/person.jpg')
                                //             as ImageProvider,
                                //     radius: 364,
                                //   ),
                                // ),
                                // const SizedBox(width: 20),
                                Text(
                                  'Personal details and Addresses'.tr(),
                                  style: GoogleFonts.montserrat(
                                    color: ColorsManager.primaryColor,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          heightSpace(30),
                          const Divider(
                            color: ColorsManager.primaryColor,
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RepeatedTextFormField(
                                  controller: TextEditingController(),
                                  hintText: "Full name".tr(),
                                  hide: false,
                                ),
                                heightSpace(20),
                                RepeatedTextFormField(
                                  controller: TextEditingController(),
                                  hintText: "Change E-mail address".tr(),
                                  hide: false,
                                ),
                                heightSpace(20),
                                DropdownButtonFormField<String>(
                                  borderRadius: BorderRadius.circular(20),
                                  dropdownColor: ColorsManager.primaryColor,
                                  value: null,
                                  onChanged: (value) {},
                                  items: <String>['Male'.tr(), 'Female'.tr(),]
                                      .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        ),
                                      )
                                      .toList(),
                                  decoration:  InputDecoration(
                                    labelText: 'Gender'.tr(),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                                heightSpace(20),
                                ElevatedButtonForSignInUp(
                                  signInOrUp: 'Select Data'.tr(),
                                  onPressed: () async {
                                    final DateTime? selectedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                    );

                                    if (selectedDate != null) {
                                      // Handle the selected date
                                    }
                                  },
                                ),
                                heightSpace(20),
                                ElevatedButtonForSignInUp(
                                  signInOrUp: 'Get Location'.tr(),
                                  onPressed: () async {
                                    // LocationPermission permission =
                                    //     await Geolocator.requestPermission();
                                    // if (permission ==
                                    //     LocationPermission.denied) {
                                    //   // Handle denied permission
                                    // } else {
                                    //   Position position =
                                    //       await Geolocator.getCurrentPosition(
                                    //     desiredAccuracy: LocationAccuracy.high,
                                    //   );
                                    //   // Handle the user's location (position.latitude and position.longitude)
                                    // }
                                  },
                                ),
                              ],
                            ),
                          ),
                          TwoButtonsInTwoScreens(
                            onPressedSaved:
                                context.read<EditUserInfoCubit>().editUserInfo,
                            onPressedDiscared: () {
                              Navigator.pop(context);
                            },
                          ),
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
