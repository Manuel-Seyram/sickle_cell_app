import 'package:flutter/material.dart';
import 'package:sickle_cell_app/screens/calls_screen.dart';
import 'package:sickle_cell_app/screens/homepage.dart';
import 'package:sickle_cell_app/screens/location.dart';
import 'package:sickle_cell_app/screens/todo_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int index = 0;
  final screens = [
   const MyHomePage(),
   const ToDo(),
   const Location(),
   const CallsPage()  
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.red.shade100,
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500)),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected),
        child: NavigationBar(
          height: 60.0,
          backgroundColor: Colors.transparent,
          selectedIndex: index,
          animationDuration: const Duration(seconds: 2),
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
                icon: Icon(Icons.task_alt_outlined),
                label: 'To do',
                selectedIcon: Icon(Icons.task_alt)),
            NavigationDestination(
                icon: Icon(Icons.location_on_outlined),
                label: 'Location',
                selectedIcon: Icon(Icons.location_on)),
            NavigationDestination(
                icon: Icon(Icons.call_outlined),
                label: 'Call',
                selectedIcon: Icon(Icons.call))
          ],
        ),
      ),
    );
  }
}
