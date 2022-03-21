import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
PreferredSizeWidget? CustomAppBar({
  String title = "",
  BuildContext? ctx,
  bool hideSearch = false,
  bool showBack = false,
  GlobalKey<ScaffoldState>? scaffoldKey,
}) {
  void searchAction() {
    Navigator.pushReplacementNamed(ctx!, '/search');
  }

  IconButton drawerIcon = IconButton(
    onPressed: () {
      scaffoldKey!.currentState!.openDrawer();
    },
    icon: Icon(
      Icons.menu,
      color: Colors.black,
      size: 30.0,
    ),
  );

  IconButton backIcon = IconButton(
    onPressed: () {
      Navigator.pop(ctx!);
    },
    icon: Icon(
      Icons.arrow_back,
      color: Colors.black,
      size: 30.0,
    ),
  );

  IconButton? leadingButton = drawerIcon;

  if (showBack) {
    leadingButton = backIcon;
  }

  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: false,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        fontFamily: "Roboto",
      ),
    ),
    leading: leadingButton,
    actions: [
      !hideSearch
          ? IconButton(
              onPressed: searchAction,
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 30.0,
              ),
            )
          : Container(),
    ],
  );
}
