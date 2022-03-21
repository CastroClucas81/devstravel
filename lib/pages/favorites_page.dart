import 'package:devstravel/components/city_box.dart';
import 'package:devstravel/components/custom_appbar.dart';
import 'package:devstravel/components/custom_drawer.dart';
import 'package:devstravel/models/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    TextStyle styles = TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    );

    return Consumer<AppData>(
      builder: (_, appdata, child) {
        List favorites = appdata.favoriteCities();

        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
            hideSearch: false,
            title: "Cidades Salvas",
            scaffoldKey: _scaffoldKey,
            ctx: context,
          ),
          drawer: customDrawer(context: context),
          body: SafeArea(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                favorites.length,
                (index) {
                  return CityBox(
                    data: favorites[index],
                    onTap: (cityData) {
                      Navigator.pushNamed(context, '/city',
                          arguments: cityData);
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
