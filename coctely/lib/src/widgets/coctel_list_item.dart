import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoctelItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String instruccions;
  const CoctelItem(
      {super.key,
      required this.imgUrl,
      required this.name,
      required this.instruccions});

  final TextStyle title = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.fade);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: Get.width,
      child: Row(
        children: [
          Image(
              height: 100,
              width: Get.width * 0.25,
              image: NetworkImage(imgUrl)),
          SizedBox(
            width: Get.width * 0.7,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.6,
                        child: Text(
                          name,
                          style: title,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    instruccions,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
