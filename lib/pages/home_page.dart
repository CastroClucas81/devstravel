import 'package:devstravel/components/custom_appbar.dart';
import 'package:devstravel/components/custom_drawer.dart';
import 'package:devstravel/models/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          hideSearch: false,
          title: "Página Home",
          scaffoldKey: _scaffoldKey,
          ctx: context,
        ),
        drawer: customDrawer(context: context),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    "Bem vindo(a) ao",
                    style: styles,
                  ),
                ),
                Image.asset(
                  "lib/assets/flutter1_devstravel_logo.png",
                  width: 200.0,
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: Text(
                    "Seu guia de viagem perfeito",
                    style: styles,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
