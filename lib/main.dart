import 'package:devstravel/models/app_data.dart';
import 'package:devstravel/pages/city_page.dart';
import 'package:devstravel/pages/continent_page.dart';
import 'package:devstravel/pages/favorites_page.dart';
import 'package:devstravel/pages/home_page.dart';
import 'package:devstravel/pages/listcity_page.dart';
import 'package:devstravel/pages/pre_load_page.dart';
import 'package:devstravel/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppData()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/preload': (context) => PreLoadPage(),
        '/home': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/continent': (context) => ContinentPage(),
        '/listcity': (context) => ListCityPage(),
        '/city': (context) => CityPage(),
        '/favorites': (context) => FavoritesPage(),
      },
      initialRoute: '/preload',
    );
  }
}
