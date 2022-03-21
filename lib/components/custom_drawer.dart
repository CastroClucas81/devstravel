import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customDrawer({required BuildContext context}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "DevsTravel",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"),
              ),
              Text(
                "V. 1.0",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontFamily: "Roboto",
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.green,
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: Text("Home"),
          onTap: () {
            Navigator.pushReplacementNamed(context, "/home");
          },
        ),
        ListTile(
          leading: Icon(
            Icons.public,
            color: Colors.black,
          ),
          title: Text("Escolher Continente"),
          onTap: () {
            Navigator.pushReplacementNamed(context, "/continent");
          },
        ),
        ListTile(
          leading: Icon(
            Icons.search,
            color: Colors.black,
          ),
          title: Text("Buscar Cidade"),
          onTap: () {
            Navigator.pushReplacementNamed(context, "/search");
          },
        ),
        ListTile(
          leading: Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          title: Text("Cidades Salvas"),
          onTap: () {
            Navigator.pushReplacementNamed(context, "/favorites");
          },
        ),
      ],
    ),
  );
}
