import 'package:coctely/src/Models/coctel_model.dart';
import 'package:coctely/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Providers/coctel_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final coctelProvider = CoctelProvider();
  List<Map<String, dynamic>> ingridients = [];
  final titleStyle = const TextStyle(
      color: titlesColor, fontWeight: FontWeight.bold, fontSize: 20);
  final pharagraphStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15);
  List<CoctelModel> _random = [];
  bool loading = true;
  String urlImagen =
      "https://i.pinimg.com/564x/4f/50/68/4f506841ff00d3cbb837978685846779.jpg";

  @override
  void initState() {
    super.initState();
    _getRandomCoctel();
  }

  void _getRandomCoctel() async {
    final random = await coctelProvider.getRandomCoctel();
    Map<String, dynamic> item1 = {
      "ingredient": random.first.strIngredient1,
      "quantity": random.first.strMeasure1
    };
    Map<String, dynamic> item2 = {
      "ingredient": random.first.strIngredient2,
      "quantity": random.first.strMeasure2
    };
    Map<String, dynamic> item3 = {
      "ingredient": random.first.strIngredient3,
      "quantity": random.first.strMeasure3
    };
    Map<String, dynamic> item4 = {
      "ingredient": random.first.strIngredient4,
      "quantity": random.first.strMeasure4
    };
    Map<String, dynamic> item5 = {
      "ingredient": random.first.strIngredient5,
      "quantity": random.first.strMeasure5
    };
    setState(() {
      _random = random;
      urlImagen = random.first.strDrinkThumb;
      ingridients = [item1, item2, item3, item4, item5];
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: Get.height * 0.1),
        child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 134, 57, 51),
            elevation: 10,
            onPressed: () {
              setState(() {
                loading = true;
              });
              _getRandomCoctel();
            },
            child: const Icon(Icons.rotate_right)),
      ),
      body: Column(
        children: [
          Container(
            height: Get.height * 0.1,
            width: Get.width,
            color: const Color.fromARGB(255, 102, 68, 68),
            child: Center(
                child: Text(
              "Prueba a preparar un coctel Aleatorio",
              style: titleStyle,
            )),
          ),
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    image: AssetImage("assets/back.jpg"))),
            child: Row(
              children: [
                Container(
                  width: Get.width * 0.5,
                  height: Get.height * 0.8,
                  color: fondoC,
                  child: Image(
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      image: NetworkImage(urlImagen)),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: Get.width * 0.5,
                      height: Get.height * 0.4,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              loading ? "" : _random.first.strInstructions,
                              style: pharagraphStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        width: Get.width * 0.5,
                        height: Get.height * 0.4,
                        child: ListView.builder(
                          itemCount: ingridients.length,
                          itemBuilder: ((context, i) {
                            if (ingridients[i]['ingredient'] != null &&
                                !loading) {
                              return Container(
                                color: i % 2 == 0
                                    ? const Color.fromARGB(98, 255, 255, 255)
                                    : const Color.fromARGB(155, 158, 158, 158),
                                height: 80,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            ingridients[i]['ingredient'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(ingridients[i]['quantity'] ?? "")
                                        ])
                                  ],
                                ),
                              );
                            } else {
                              return const Text("");
                            }
                          }),
                          //
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
