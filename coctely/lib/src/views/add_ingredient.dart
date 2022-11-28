import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Providers/coctel_provider.dart';

class AddIngredient extends StatefulWidget {
  final void Function(Map<String, dynamic>) onAdd;
  const AddIngredient({super.key, required this.onAdd});

  @override
  State<StatefulWidget> createState() => _AddIngredientState();
}

class _AddIngredientState extends State<AddIngredient> {
  final TextEditingController ingredientController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final titleStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);

  List<String> listIngridients = [];
  final coctelProvider = CoctelProvider();
  @override
  void initState() {
    super.initState();
    _setIngridients();
  }

  void _setIngridients() async {
    List<String> ingridients = await coctelProvider.getAllIngredients();
    setState(() {
      listIngridients.addAll(ingridients);
    });
  }

  Widget addIngridient() {
    return EasyAutocomplete(
      controller: ingredientController,
      suggestions: listIngridients,
      decoration: InputDecoration(
          labelText: 'Ingridient',
          isDense: true,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          labelStyle: const TextStyle(color: Colors.white),
          fillColor: const Color.fromARGB(0, 255, 255, 255),
          errorStyle:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          hintStyle: const TextStyle(
            color: Colors.white,
          )),
      onChanged: (value) {
        // filterDrillNames();
      },
      onSubmitted: (value) {
        // moveToPosition(drillNameField);
      },
      suggestionBackgroundColor: const Color.fromARGB(186, 30, 40, 58),
      inputTextStyle: const TextStyle(color: Colors.white),
      suggestionTextStyle: const TextStyle(color: Colors.white),
      suggestionBuilder: (data) {
        return Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: const Color.fromARGB(240, 30, 40, 58),
                borderRadius: BorderRadius.circular(5)),
            child: Text(data, style: const TextStyle(color: Colors.white)));
      },
    );
  }

  Widget quantity() {
    return TextField(
      controller: quantityController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          isDense: true,
          filled: true,
          labelText: "Quantity",
          labelStyle: const TextStyle(color: Colors.white),
          fillColor: Colors.transparent,
          enabled: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: Get.height * 0.1,
          width: Get.width,
          color: const Color.fromARGB(255, 102, 68, 68),
          child: Center(
              child: Text(
            "Agrega un ingrediente a tu coctel",
            style: titleStyle,
          )),
        ),
        Container(
          height: Get.height * 0.8,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  image: AssetImage("assets/licores.png"))),
          child: Column(
            children: [
              SizedBox(
                  height: Get.height * 0.2,
                  width: Get.width * 0.7,
                  child: Center(
                    child: addIngridient(),
                  )),
              SizedBox(
                  height: Get.height * 0.2,
                  width: Get.width * 0.7,
                  child: quantity()),
              SizedBox(
                height: Get.height * 0.1,
                child: CupertinoButton(
                    color: const Color.fromARGB(255, 126, 72, 68),
                    child: const Text("Agregar"),
                    onPressed: () {
                      if (ingredientController.text.isNotEmpty &&
                          quantityController.text.isNotEmpty) {
                        widget.onAdd({
                          "ingridient": ingredientController.text,
                          "quantity": quantityController.text
                        });

                        Navigator.pop(context);
                      }
                    }),
              )
            ],
          ),
        ),
      ],
    );
  }
}
