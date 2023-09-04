import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/count_provider.dart';
import 'package:provider_practice/provider/favourite_provider.dart';
import 'package:provider_practice/provider/slider_provider.dart';
import 'package:provider_practice/provider/theme_changer_provider.dart';
import 'package:provider_practice/screens/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SliderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
            ),
            home: const DarkThemeScreen(),
          );
        },
      ),
    );
  }
}
