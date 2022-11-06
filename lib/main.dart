import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/presentation/screens/home.dart';
import 'package:resume/presentation/screens/splash.dart';
import 'package:resume/theme.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>ThemeProvider()),
        ],
        child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Resume',
      theme: themeProvider.isDarkTheme() == true ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: const Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
