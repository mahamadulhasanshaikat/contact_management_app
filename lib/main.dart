import 'package:flutter/material.dart';
import 'app/routes/app_router.dart';
import 'app/theme/app_theme.dart';
import 'viewmodels/theme_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

          themeMode: themeVM.isDarkMode ? ThemeMode.dark : ThemeMode.light,

          theme: AppTheme.light,
          darkTheme: AppTheme.dark,

          routerConfig: appRouter,
        );
      },
    );
  }
}
