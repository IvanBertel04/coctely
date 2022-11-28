import 'package:coctely/src/Models/coctel_model.dart';
import 'package:coctely/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Providers/coctel_provider.dart';
import '../widgets/coctel_list_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<StatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with TickerProviderStateMixin {
  final coctelProvider = CoctelProvider();
  final TextEditingController searchController = TextEditingController();
  final titleStyle = const TextStyle(
      color: titlesColor, fontWeight: FontWeight.bold, fontSize: 20);
  final pharagraphStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15);
  List<CoctelModel> _cocteles = [];
  bool loading = true;
  String urlImagen =
      "https://i.pinimg.com/564x/4f/50/68/4f506841ff00d3cbb837978685846779.jpg";

  @override
  void initState() {
    super.initState();
  }

  void _getCoctelByName(String name) async {
    final cocteles = await coctelProvider.getCoctelByName(name);
    setState(() {
      _cocteles = cocteles;
      loading = false;
    });
  }

  Widget buildSearch() {
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
          labelText: "Search",
          labelStyle: const TextStyle(color: Colors.white),
          fillColor: Colors.transparent,
          enabled: true),
    );
  }

  Widget generateList() {
    if (!loading && _cocteles.isNotEmpty) {
      return ListView.builder(
          itemCount: _cocteles.length,
          itemBuilder: ((context, index) {
            var item = _cocteles[index];
            if (!loading) {
              return CoctelItem(
                imgUrl: item.strDrinkThumb,
                name: item.strDrink,
                instruccions: item.strInstructions,
              );
            }
            return const Text("cocteles[index].strDrink");
          }));
    } else {
      if (!loading && _cocteles.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.5,
              child: const Image(image: AssetImage("assets/simpson.png")),
            ),
            SizedBox(
              width: Get.width,
              child: Center(
                child: Text(
                  "LO SIENTO BARNEY NO PUDO ENCONTRAR TU COCTEL",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: Get.width * 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.fade),
                ),
              ),
            )
          ],
        );
      } else {
        return const Image(image: AssetImage("assets/duffman.png"));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: Get.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/back.jpg"))),
            child: Column(
              children: [
                Container(
                  height: Get.height * 0.1,
                  width: Get.width,
                  color: const Color.fromARGB(255, 102, 68, 68),
                  child: Center(
                      child: Text(
                    "Prueba buscar el coctel que necesitas",
                    style: titleStyle,
                  )),
                ),
                SizedBox(
                  height: Get.height * 0.15,
                  width: Get.width,
                  // color: Colors.blueAccent,
                  child: Center(
                    child: SizedBox(
                      width: Get.width * 0.9,
                      child: Row(children: [
                        SizedBox(
                          width: Get.width * 0.75 * 0.9,
                          child: buildSearch(),
                        ),
                        SizedBox(
                          width: Get.width * 0.25 * 0.9,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  loading = true;
                                });
                                _getCoctelByName(searchController.text);
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                        )
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.6,
                  width: Get.width,
                  // color: const Color.fromARGB(255, 79, 68, 68),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10),
                    child: generateList(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
