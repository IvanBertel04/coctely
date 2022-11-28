// ignore_for_file: file_names

import 'package:coctely/src/views/create_a_coctel.dart';
import 'package:coctely/src/views/home_view.dart';
import 'package:coctely/src/views/search_view.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> pages = [
    (const SearchView()),
    (const HomeView()),
    (const CreateACoctel()),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 1;
  }

  void setCurrentIndex(int val) {
    setState(() {
      _currentIndex = val;
    });
  }

  List<Widget> _buildOffstageWidgets() {
    return pages
        .map(
          (widget) => Offstage(
            offstage: _currentIndex != pages.indexOf(widget),
            child: Navigator(
              onGenerateRoute: (routeSettings) {
                return MaterialPageRoute(builder: (_) => widget);
              },
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              extendBody: true,
              body: Stack(children: _buildOffstageWidgets()),
              bottomNavigationBar: BottomNavigationComponent(
                index: _currentIndex,
                onTapFunction: setCurrentIndex,
              )),
        ));
  }
}
