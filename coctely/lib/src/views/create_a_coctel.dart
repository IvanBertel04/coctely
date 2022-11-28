import 'package:coctely/src/Models/coctel_model.dart';
import 'package:coctely/src/utils/colors.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Providers/coctel_provider.dart';
import 'add_ingredient.dart';

class CreateACoctel extends StatefulWidget {
  const CreateACoctel({super.key});

  @override
  State<StatefulWidget> createState() => _CreateACoctelState();
}

class _CreateACoctelState extends State<CreateACoctel>
    with TickerProviderStateMixin {
  final coctelProvider = CoctelProvider();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController ingredientController = TextEditingController();
  List<Map<String, dynamic>> listIngridients = [];

  final titleStyle = const TextStyle(
      color: titlesColor, fontWeight: FontWeight.bold, fontSize: 20);
  final pharagraphStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15);
  bool loading = true;
  String urlImagen =
      "https://i.pinimg.com/564x/4f/50/68/4f506841ff00d3cbb837978685846779.jpg";

  @override
  void initState() {
    super.initState();
  }

  Widget changeName() {
    return TextField(
      controller: searchController,
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
          labelText: "Name",
          labelStyle: const TextStyle(color: Colors.white),
          fillColor: Colors.transparent,
          enabled: true),
    );
  }

  void agregarNuevoIngrediente(Map<String, dynamic> item) {
    setState(() {
      listIngridients.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bartender.jpg"),
              fit: BoxFit.cover,
              alignment: Alignment.center)),
      child: ListView(
        children: [
          Container(
            height: Get.height * 0.1,
            width: Get.width,
            color: const Color.fromARGB(255, 102, 68, 68),
            child: Center(
                child: Text(
              "Arma la reseta para tu coctel ",
              style: titleStyle,
            )),
          ),
          Row(
            children: [
              SizedBox(
                width: Get.width,
                height: Get.height * 0.8,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.3,
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          changeName(),
                          const SizedBox(height: 20),
                          CupertinoButton(
                              color: Colors.red,
                              padding: const EdgeInsets.all(20),
                              child: const Text("Add new ingredient"),
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddIngredient(
                                              onAdd: agregarNuevoIngrediente,
                                            )));
                              })
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height * 0.5,
                      color: Color.fromARGB(66, 159, 62, 62),
                      child: ListView.builder(
                          itemCount: listIngridients.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              height: 50,
                              color: index % 2 == 0 ? Colors.grey : Colors.red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(listIngridients[index]['ingridient']),
                                  Text(listIngridients[index]['quantity'])
                                ],
                              ),
                            );
                          })),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
