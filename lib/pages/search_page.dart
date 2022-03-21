import 'package:devstravel/components/city_box.dart';
import 'package:devstravel/components/custom_appbar.dart';
import 'package:devstravel/components/custom_drawer.dart';
import 'package:devstravel/models/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var list = [];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void doSearch(pageContext, text) {
    var newList =
        Provider.of<AppData>(pageContext, listen: false).searchCity(text);

    setState(() {
      list = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (_, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          hideSearch: true,
          title: "Busque uma cidade",
          scaffoldKey: _scaffoldKey,
          ctx: context,
        ),
        drawer: customDrawer(context: context),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: TextField(
                  onChanged: (text) => doSearch(context, text),
                  decoration: InputDecoration(
                    hintText: 'Digite o nome de uma cidade',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.search,
                      size: 32.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    list.length,
                    (index) {
                      return CityBox(
                        data: list[index],
                        onTap: (cityData) {
                          Navigator.pushNamed(context, '/city', arguments: cityData);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
