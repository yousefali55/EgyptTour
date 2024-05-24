import 'package:easy_localization/easy_localization.dart';
import 'package:egypttour/mutual_widgets/button_upload_image.dart';
import 'package:egypttour/mutual_widgets/custom_snack_bar.dart';
import 'package:egypttour/mutual_widgets/elevated_button_for_sign_in_up.dart';
import 'package:egypttour/mutual_widgets/repeated_text_field.dart';
import 'package:egypttour/mutual_widgets/texts_in_sign_in_up.dart';
import 'package:egypttour/spacing/spacing.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:egypttour/views/register_screen/data/cubit/sign_up_email_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.primaryColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BlocConsumer<SignUpEmailCubit, SignUpEmailState>(
                    listener: (context, state) {
                      if (state is SignUpEmailSuccess) {
                        showCustomSnackbar(context, 'Success'.tr(),
                            ColorsManager.primaryColor);
                      } else if (state is SignUpEmailFailure) {
                        showCustomSnackbar(context,
                            'Failed, ${state.errorMessage}', ColorsManager.red);
                      } else if (state is SignUpEmailImageSuccess) {
                        showCustomSnackbar(context, 'Image uploaded'.tr(),
                            ColorsManager.primaryColor);
                      }
                    },
                    builder: (context, state) {
                      return Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: const BoxDecoration(
                            color: ColorsManager.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                 TextInSignInUp(
                                    textWelcomeOrGetStarted: 'Create account'.tr()),
                                SizedBox(
                                  height: 210.h,
                                  width: 190.w,
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: CircleAvatar(
                                          radius: 140,
                                          backgroundImage:
                                              state is SignUpEmailImageSuccess &&
                                                      state.image != null
                                                  ? FileImage(state.image!)
                                                  : const AssetImage('assets/images/person.jpg'),
                                        ),
                                      ),
                                      Positioned(
                                        right: 80,
                                        bottom: 0,
                                        child: ButtonUploadIamge(
                                          onTap: () {
                                            context
                                                .read<SignUpEmailCubit>()
                                                .pickImage();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                heightSpace(20),
                                RepeatedTextFormField(
                                  hide: false,
                                  hintText: 'Full name'.tr(),
                                  controller:
                                      context.read<SignUpEmailCubit>().fullName,
                                ),
                                heightSpace(10),
                                heightSpace(10),
                                RepeatedTextFormField(
                                  hide: false,
                                  hintText: 'Email'.tr(),
                                  controller:
                                      context.read<SignUpEmailCubit>().email,
                                ),
                                heightSpace(10),
                                RepeatedTextFormField(
                                  hide: true,
                                  hintText: 'Password'.tr(),
                                  controller:
                                      context.read<SignUpEmailCubit>().password,
                                ),
                                heightSpace(10),
                                RepeatedTextFormField(
                                  hide: true,
                                  hintText: 'Confirm password'.tr(),
                                  controller: context
                                      .read<SignUpEmailCubit>()
                                      .passwordConfirm,
                                ),
                                heightSpace(10),
                                // DropdownButtonFormField<String>(
                                //   // padding: const EdgeInsets.only(right: 85, left: 34),
                                //   focusColor: ColorsManager.white,
                                //   dropdownColor: ColorsManager.white,
                                //   items: const [
                                //     DropdownMenuItem(
                                //       value: 'ADMIN',
                                //       child: Text('ADMIN'),
                                //     ),
                                //     DropdownMenuItem(
                                //       value: 'USER',
                                //       child: Text('USER'),
                                //     ),
                                //   ],
                                //   onChanged: (value) {
                                //     if (value != null) {
                                //     }
                                //   },
                                //   decoration: InputDecoration(
                                //     contentPadding: const EdgeInsets.all(5),
                                //     hintText: 'User type',
                                //     hintStyle: GoogleFonts.sora(
                                //       color:
                                //           const Color.fromARGB(128, 36, 52, 67),
                                //       fontSize: 15,
                                //       fontWeight: FontWeight.w500,
                                //     ),
                                //     filled: true,
                                //     fillColor: const Color(0xFFFFF9EB),
                                //     border: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(8),
                                //     ),
                                //     focusedBorder: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(10),
                                //       borderSide: const BorderSide(
                                //         width: 1,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // DropdownButtonFormField<String>(
                                //   value: context
                                //           .read<SignUpEmailCubit>()
                                //           .role
                                //           .text ??
                                //       'USER', // Provide a default value if it's null
                                //   items: const [
                                //     DropdownMenuItem(
                                //       value: 'USER',
                                //       child: Text('USER'),
                                //     ),
                                //     DropdownMenuItem(
                                //       value: 'ADMIN',
                                //       child: Text('ADMIN'),
                                //     ),
                                //   ],
                                //   onChanged: (value) {},
                                //   decoration: InputDecoration(
                                //     hintText: 'User type'.tr(),
                                //     filled: true,
                                //     fillColor: Colors.white,
                                //     border: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(8),
                                //     ),
                                //     focusedBorder: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(10),
                                //       borderSide: const BorderSide(
                                //         color: ColorsManager.primaryColor,
                                //         width: 1,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                heightSpace(30),
                                state is SignUpEmailLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: ColorsManager.primaryColor,
                                        ),
                                      )
                                    : ElevatedButtonForSignInUp(
                                        signInOrUp: 'Sign Up'.tr(),
                                        onPressed: () {
                                          context
                                              .read<SignUpEmailCubit>()
                                              .signUpEmail();
                                        }),
                                heightSpace(10),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
