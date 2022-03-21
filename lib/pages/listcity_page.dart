import 'package:devstravel/components/city_box.dart';
import 'package:devstravel/components/custom_appbar.dart';
import 'package:devstravel/components/custom_drawer.dart';
import 'package:devstravel/models/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCityPage extends StatelessWidget {
  const ListCityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    final continentIndex = ModalRoute.of(context)!.settings.arguments;

    void cityBoxAction(ctx, cityData) {
      Navigator.pushNamed(ctx, '/city', arguments: cityData);
    }

    return Consumer<AppData>(
      builder: (_, appdata, child) {
        var cities = [];

        for (var country in appdata.data[int.parse(continentIndex.toString())]
            ['countries']) {
          cities.addAll(country['cities']);
        }

        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
              hideSearch: false,
              title:
                  '${appdata.data[int.parse(continentIndex.toString())]['name']} (${cities.length} cidades)',
              scaffoldKey: _scaffoldKey,
              ctx: context,
              showBack: true),
          drawer: customDrawer(context: context),
          body: SafeArea(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(
                cities.length,
                (i) {
                  return CityBox(
                    data: cities[i],
                    onTap: (cityData) {
                      cityBoxAction(context, cityData);
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
