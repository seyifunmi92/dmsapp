import 'dart:async';

import 'package:dms/blocs/company_bloc.dart';
import 'package:dms/blocs/country_bloc.dart';
import 'package:dms/blocs/login_bloc.dart';
import 'package:dms/blocs/product_bloc.dart';
import 'package:dms/constant.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  runApp(const DmsAppRoot());
}

class DmsAppRoot extends StatefulWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  static _DmsAppRootState? of(BuildContext context) =>
      context.findAncestorStateOfType<_DmsAppRootState>();

  const DmsAppRoot({Key? key}) : super(key: key);

  @override
  State<DmsAppRoot> createState() => _DmsAppRootState();
}

class _DmsAppRootState extends State<DmsAppRoot> {
  int _selectedDrawerItem = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: DmsAppRoot.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<LogInBloc>(create: (context) => LogInBloc()),
              ChangeNotifierProvider<CountryBloc>(create: (context) => CountryBloc()),
              ChangeNotifierProvider<CompanyBloc>(create: (context) => CompanyBloc()),
              ChangeNotifierProvider<ProductBloc>(create: (context) => ProductBloc()),
            ],
            child: MaterialApp(
              // Remove the debug banner
              debugShowCheckedModeBanner: false,
              title: dmsTitle,
              theme: AppThemeData.lightTheme,
              darkTheme: AppThemeData.darkTheme,
              themeMode: currentMode,
              home: SplashScreen(),
            ),
          );
        });
  }

  /// Returns index of selected item in drawer
  int getSelected() {
    return _selectedDrawerItem;
  }

  /// Updates index of selected item in drawer
  void setSelected(int index) {
    _selectedDrawerItem = index;
  }

}

// class FindHomeScreen extends StatefulWidget {
//   const FindHomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FindHomeScreen> createState() => _FindHomeScreenState();
// }
//
// class _FindHomeScreenState extends State<FindHomeScreen> {
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final LogInBloc lb = context.read<LogInBloc>();
//     lb.checkOnboardingRead();
//     if(lb.isSignedIn == true && lb.token?.isNotEmpty == true)
//     {
//       return DashBoard();
//     } else if( lb.isOnboardingRead == true ) {
//       return LoginScreen();
//     }else {
//       return Onboarding();
//     }
//   }
// }

