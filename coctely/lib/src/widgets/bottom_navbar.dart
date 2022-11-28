import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationComponent extends StatelessWidget {
  const BottomNavigationComponent(
      {Key? key, required this.index, required this.onTapFunction})
      : super(key: key);

  final int index;
  final void Function(int) onTapFunction;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: ClipRRect(
            child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: onTapFunction,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: const Color(0xFF737E8D),
          iconSize: 20,
          backgroundColor: const Color.fromARGB(255, 102, 68, 68),
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                label: "Search"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house), label: "Home"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.paintbrush),
                label: "Create a Coctel"),
          ],
        )));
  }
}
