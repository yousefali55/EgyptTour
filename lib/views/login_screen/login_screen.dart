import 'package:easy_localization/easy_localization.dart';
import 'package:egypttour/changers/language_changer/cubit/language_changer_cubit.dart';
import 'package:egypttour/mutual_widgets/custom_snack_bar.dart';
import 'package:egypttour/mutual_widgets/elevated_button_for_sign_in_up.dart';
import 'package:egypttour/mutual_widgets/repeated_text_field.dart';
import 'package:egypttour/mutual_widgets/texts_in_sign_in_up.dart';
import 'package:egypttour/spacing/spacing.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:egypttour/views/floating_action/floating_action_button.dart';
import 'package:egypttour/views/login_screen/data/cubit/sign_in_email_cubit.dart';
import 'package:egypttour/views/login_screen/widgets/dont_have_account.dart';
import 'package:egypttour/views/login_screen/widgets/forget_pawword.dart';
import 'package:egypttour/views/register_screen/data/cubit/sign_up_email_cubit.dart';
import 'package:egypttour/views/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<_LoginScreenState> _loginScreenKey = GlobalKey();
  late LanguageChangerCubit _languageChangerCubit;

  @override
  void initState() {
    super.initState();
    _languageChangerCubit = LanguageChangerCubit(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _languageChangerCubit,
      child: BlocProvider(
        create: (context) => SignInEmailCubit(),
        child: Scaffold(
          backgroundColor: ColorsManager.primaryColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/tourist.png'),
                heightSpace(20),
                Container(
                  height: 660.h,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    color: ColorsManager.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: BlocConsumer<SignInEmailCubit, SignInEmailState>(
                    listener: (context, state) {
                      if (state is SignInEmailSuccess) {
                        showCustomSnackbar(context, 'Success'.tr(),
                            ColorsManager.primaryColor);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const FloatingActionButtonScreen(),
                          ),
                        );
                      } else if (state is SignInEmailFailure) {
                        showCustomSnackbar(
                          context,
                          _getErrorMessage(state.errorMessge),
                          ColorsManager.red,
                        );
                      }
                    },
                    builder: (context, state) {
                      return Form(
                        key:
                            _loginScreenKey, // Assign the GlobalKey to the Form
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            heightSpace(20),
                            TextInSignInUp(
                              textWelcomeOrGetStarted: 'Welcome back!'.tr(),
                            ),
                            RepeatedTextFormField(
                              icon: const Icon(Icons.person),
                              hide: false,
                              hintText: 'Enter email'.tr(),
                              controller: context
                                  .read<SignInEmailCubit>()
                                  .emailController,
                            ),
                            heightSpace(25),
                            RepeatedTextFormField(
                              icon: const Icon(Icons.key),
                              hide: true,
                              hintText: 'Enter password'.tr(),
                              controller: context
                                  .read<SignInEmailCubit>()
                                  .passwordController,
                            ),
                            heightSpace(8),
                            ForgetPasswordOrChangePassword(
                              forgetOrChange: 'Forget Password?'.tr(),
                              onPressed: () {},
                            ),
                            heightSpace(50),
                            state is SignInEmailLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: ColorsManager.primaryColor,
                                    ),
                                  )
                                : ElevatedButtonForSignInUp(
                                    signInOrUp: 'Sign In'.tr(),
                                    onPressed: () {
                                      context.read<SignInEmailCubit>().login();
                                    },
                                  ),
                            heightSpace(20),
                            DontHaveAccount(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => SignUpEmailCubit(),
                                      child: const RegisterScreen(),
                                    ),
                                  ),
                                );
                              },
                            ),
                            heightSpace(20),
                            Center(
                              child: BlocBuilder<LanguageChangerCubit,
                                  LanguageChangerState>(
                                builder: (context, languageState) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<LanguageChangerCubit>()
                                          .switchLanguage();
                                      _loginScreenKey.currentState
                                          ?.setState(() {});
                                    },
                                    child: Text(
                                      languageState.locale.languageCode == 'en'
                                          ? 'Switch to Arabic'
                                          : 'حول للإنجليزية',
                                      style: GoogleFonts.sora(
                                        color: ColorsManager.brown,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ).tr(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _getErrorMessage(String errorMessage) {
  if (errorMessage.contains("email")) {
    return "Email field must be unique".tr();
  }
  return errorMessage.tr();
}
