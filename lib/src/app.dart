import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqu_copy_trader/src/core/services/app_routes.dart';
import 'package:roqu_copy_trader/src/core/services/bloc_service.dart';
import 'package:roqu_copy_trader/src/core/styles/app_theme.dart';

class RoquApp extends StatelessWidget {
  const RoquApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, context) {
        return MultiBlocProvider(
          providers: BlocService.providers,
          child: MaterialApp.router(
            title: 'Roqu Test',
            theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
            darkTheme: darkTheme,
            themeMode: ThemeMode.dark,
            routerConfig: AppRoutes.router,
          ),
        );
      },
    );
  }
}
