import 'package:devstravel/components/custom_appbar.dart';
import 'package:devstravel/components/custom_drawer.dart';
import 'package:devstravel/models/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityPage extends StatelessWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? cityData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    return Consumer<AppData>(
      builder: (_, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          hideSearch: false,
          title: "Página cidade",
          scaffoldKey: _scaffoldKey,
          ctx: context,
        ),
        drawer: customDrawer(context: context),
        body: SafeArea(
          child: Center(
            child: Text('...'),
          ),
        ),
      ),
    );
  }
}
