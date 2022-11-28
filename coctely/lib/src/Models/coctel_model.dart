class Coctel {
  List<CoctelModel> items = [];

  Coctel();

  Coctel.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final pelicula = CoctelModel.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class CoctelModel {
  late String? idDrink;
  late String strDrink;
  late String? strCategory;
  late String? strAlcoholic;
  late String strInstructions;
  late String strDrinkThumb;
  late String? strIngredient1;
  late String? strIngredient2;
  late String? strIngredient3;
  late String? strIngredient4;
  late String? strIngredient5;
  late String? strMeasure1;
  late String? strMeasure2;
  late String? strMeasure3;
  late String? strMeasure4;
  late String? strMeasure5;

  CoctelModel(
      this.idDrink,
      this.strDrink,
      this.strCategory,
      this.strAlcoholic,
      this.strInstructions,
      this.strDrinkThumb,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5,
      this.strMeasure1,
      this.strMeasure2,
      this.strMeasure3,
      this.strMeasure4,
      this.strMeasure5);

  CoctelModel.fromJsonMap(Map<String, dynamic> json) {
    idDrink = json['idDrink'];
    strDrink = json['strDrink'];
    strCategory = json['strCategory'];
    strAlcoholic = json['strAlcoholic'];
    strInstructions = json['strInstructions'];
    strDrinkThumb = json['strDrinkThumb'];
    strIngredient1 = json['strIngredient1'];
    strIngredient2 = json['strIngredient2'];
    strIngredient3 = json['strIngredient3'];
    strIngredient4 = json['strIngredient4'];
    strIngredient5 = json['strIngredient5'];
    strMeasure1 = json['strMeasure1'];
    strMeasure2 = json['strMeasure2'];
    strMeasure3 = json['strMeasure3'];
    strMeasure4 = json['strMeasure4'];
    strMeasure5 = json['strMeasure5'];
  }

  getCoctelImg() {
    if (strDrinkThumb == null) {
      return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
    } else {
      return strDrinkThumb;
    }
  }
}
