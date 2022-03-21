import 'package:devstravel/components/custom_appbar.dart';
import 'package:devstravel/components/custom_drawer.dart';
import 'package:devstravel/models/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    TextStyle styles = TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    );

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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Página de busca..."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
