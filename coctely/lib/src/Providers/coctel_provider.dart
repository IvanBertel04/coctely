import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../Models/coctel_model.dart';

class CoctelProvider {
  final Uri _ramdomCoctel =
      Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php');
  final String _getCoctel =
      "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=";

  final String _getAllIngridients =
      "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list";

  Future<List<CoctelModel>> getRandomCoctel() async {
    final resp = await http.get(_ramdomCoctel);

    final decodeData = json.decode(resp.body);
    final results = Coctel.fromJsonList(decodeData['drinks']);
    return (results.items);
  }

  Future<List<CoctelModel>> getCoctelByName(String name) async {
    final url = Uri.parse(_getCoctel + name);
    final resp = await http.get(url);

    final decodeData = json.decode(resp.body);
    if (decodeData['drinks'] != null) {
      final results = Coctel.fromJsonList(decodeData['drinks']);
      return results.items;
    }

    return ([]);
  }

  Future<List<String>> getAllIngredients() async {
    final url = Uri.parse(_getAllIngridients);
    final resp = await http.get(url);

    final decodeData = json.decode(resp.body);
    if (decodeData['drinks'] != null) {
      List<String> items = [];

      for (var i = 0; i < decodeData['drinks'].length; i++) {
        items.add(decodeData['drinks'][i]['strIngredient1']);
      }
      return items;
    }

    return ([]);
  }
}
