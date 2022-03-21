import 'package:devstravel/components/custom_drawer.dart';
import 'package:devstravel/models/app_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    bool heart = false;

    Map<String, dynamic> cityData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double footerHeight = MediaQuery.of(context).padding.bottom;

    void backButtonAction() {
      Navigator.pop(context);
    }

    var starRate = double.parse(cityData['review']).floor();
    final stars = [];

    for (var i = 0; i < 5; i++) {
      if (i < starRate)
        stars.add(true);
      else
        stars.add(false);
    }

    return Consumer<AppData>(
      builder: (_, appdata, child) {
        heart = appdata.hasFavorite(cityData['name']);

        return Scaffold(
          key: _scaffoldKey,
          drawer: customDrawer(context: context),
          body: SafeArea(
              child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 250.0,
                child: Image.network(
                  cityData['places'][0]['img'].toString(),
                  fit: BoxFit.cover,
                ),
              ),
              ListView(
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 220.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                      cityData['name'].toString(),
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: stars[0]
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: 16.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: stars[1]
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: 16.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: stars[2]
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: 16.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: stars[3]
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: 16.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: stars[4]
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: 16.0,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          cityData['review'].toString(),
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 11,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(15.0),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    heart = appdata.favorite(cityData['name']);
                                  });
                                },
                                icon: Icon(
                                  heart
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 0,
                            left: 10.0,
                            right: 10.0,
                            bottom: 10.0,
                          ),
                          child: Text(
                            cityData['description'].toString(),
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 11.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 10.0, bottom: 15.0),
                          child: Text(
                            "PRINCIPAIS PONTOS TURÍSTICOS",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GridView.count(
                          padding: EdgeInsets.only(bottom: footerHeight),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 10 / 11,
                          children: List.generate(
                            cityData['places'].length,
                            (index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.network(
                                            cityData['places'][index]['img']
                                                .toString(),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        cityData['places'][index]['name']
                                            .toString(),
                                        style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 15.0),
                                      child: Text(
                                        "Ponto Turístico",
                                        style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 12.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: statusBarHeight),
                height: 50.0,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: backButtonAction,
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}
