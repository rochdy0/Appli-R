import 'package:appli_r/presentation/ui/pages/carte/carte_page.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'pages/parametres/parametre_page.dart';

class NavigationBarre extends StatefulWidget {
  const NavigationBarre({super.key});

  @override
  State<NavigationBarre> createState() => _NavigationBarreState();
}

class _NavigationBarreState extends State<NavigationBarre> {
  int currentPageIndex = 0;
  bool showNav = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: !showNav ? 0 : 95,
      curve: Curves.easeInOut,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: showNav ? Offset.zero : const Offset(0, 1),
        child: NavigationBar(
          animationDuration: const Duration(milliseconds: 1000),
          backgroundColor: Colors.white,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: const Color.fromARGB(255, 67, 189, 189),
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.map),
              icon: Icon(Icons.map_outlined),
              label: 'Carte',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.confirmation_number),
              icon: Icon(Icons.confirmation_number_outlined),
              label: 'Mes titres',
            ),
          ],
        ))
      ),
      body: <Widget>[
        CartePage(
          isNavDisplayed: (boolean) => setState(() {
            showNav = boolean;
          })
        ),
        ParametrePage(),
      ][currentPageIndex],
    );
  }
}
