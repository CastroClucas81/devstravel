import 'package:devstravel/components/city_box.dart';
import 'package:devstravel/components/custom_appbar.dart';
import 'package:devstravel/components/custom_drawer.dart';
import 'package:devstravel/models/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContinentPage extends StatelessWidget {
  const ContinentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    TextStyle styles = TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    );

    void seeCity(ctx, continentIndex) {
      Navigator.pushNamed(ctx, '/listcity', arguments: continentIndex);
    }

    void cityBoxAction(ctx, cityData) {
      Navigator.pushNamed(ctx, '/city', arguments: cityData);
    }

    return Consumer<AppData>(
      builder: (context, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          hideSearch: false,
          title: "Escolha um Continente",
          scaffoldKey: _scaffoldKey,
          ctx: context,
        ),
        drawer: customDrawer(context: context),
        body: SafeArea(
          child: ListView.builder(
            itemCount: appdata.data.length,
            itemBuilder: (context, index) {
              var cities = [];

              for (var country in appdata.data[index]['countries']) {
                cities.addAll(country['cities']);
              }

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${appdata.data[index]['name']} (${cities.length})",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            seeCity(context, index);
                          },
                          child: Text(
                            "Ver cidades",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 130.0,
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cities.length,
                      itemBuilder: (cityContext, cityIndex) {
                        return CityBox(
                          data: cities[cityIndex],
                          onTap: (cityData) {
                            cityBoxAction(context, cityData);
                          },
                        );
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
