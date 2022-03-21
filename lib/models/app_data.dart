import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];
  //o ideal é q cada cidade tivesse um id... vamos salvar o nome de cada cidade
  var favorites = [];
  List result = [];

  bool hasFavorite(cityName) {
    return favorites.contains(cityName);
  }

  bool favorite(cityName) {
    if (this.hasFavorite(cityName)) {
      favorites.remove(cityName);
      return false;
    } else {
      favorites.add(cityName);
      return true;
    }
  }

  List favoriteCities() {
    List result = [];

    for (var favorite in favorites) {
      var foundCities = this.searchCity(favorite);

      if (foundCities.length > 0) {
        result.add(foundCities[0]);
      }
    }

    return result;
  }

  List searchCity(text) {
    List result = [];

    // tirando espaços e deixando minúsculo
    text = text.toString().trim().toLowerCase();

    if (text.toString() == '') {
      return result;
    }

    for (var continents in data) {
      for (var country in continents['countries']) {
        for (var city in country['cities']) {
          if (city['name'].toString().toLowerCase().contains(text)) {
            result.add(city);
          }
        }
      }
    }

    return result;
  }

  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  Future<bool> requestData() async {
    final response = await http.get(
      Uri.parse('https://api.b7web.com.br/flutter1wb/'),
    );

    if (response.statusCode == 200) {
      setData(jsonDecode(response.body));
      return true;
    } else {
      return false;
    }
  }
}
