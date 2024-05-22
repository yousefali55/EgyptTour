import 'package:easy_localization/easy_localization.dart';
import 'package:egypttour/routing/app_router.dart';
import 'package:egypttour/routing/routes.dart';
import 'package:egypttour/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EgyptTour extends StatelessWidget {
  final AppRouter appRouter;
  const EgyptTour({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: ColorsManager.white,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
        ),
        themeMode: MediaQuery.platformBrightnessOf(context) == Brightness.dark
            ? ThemeMode.dark
            : ThemeMode.light,
        initialRoute: Routes.floatingActionButton,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
