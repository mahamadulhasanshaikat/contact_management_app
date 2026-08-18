// import 'package:contact_management_app/app/routes/app_router.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'Flutter Demo',
//       theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
//      routerConfig: appRouter,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'app/routes/app_router.dart';
import 'app/theme/app_theme.dart'; // আপনার AppTheme ইমপোর্ট করুন
import 'viewmodels/theme_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // অ্যাপ ওপেন হওয়ার সময় লোকাল স্টোরেজ থেকে সেভ করা থিম লোড হবে
  await ThemeViewModel.instance.loadTheme();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = ThemeViewModel.instance;

    return ListenableBuilder(
      listenable: themeVM,
      builder: (context, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Contact Management App',

          // ThemeViewModel থেকে বর্তমান স্টেট অনুযায়ী লাইট বা ডার্ক সিলেক্ট হবে
          themeMode: themeVM.isDarkMode ? ThemeMode.dark : ThemeMode.light,

          // আপনার তৈরি করা AppTheme এখানে সরাসরি ব্যবহার হচ্ছে:
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,

          routerConfig: appRouter,
        );
      },
    );
  }
}
