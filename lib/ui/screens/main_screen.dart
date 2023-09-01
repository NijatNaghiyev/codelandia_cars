import 'package:codelandia_cars/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  Widget activeScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) {
      activeScreen = const HomeScreen();
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: activeScreen,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          child: BottomNavigationBar(
            enableFeedback: true,
            elevation: 10,
            onTap: (value) {
              setState(() {});
              currentIndex = value;
            },
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            currentIndex: currentIndex,
            selectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(Icons.home_filled),
                  label: 'home'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(Icons.favorite),
                  label: 'favorite'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: 'cart'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(Icons.settings),
                  label: 'settings'),
            ],
          ),
        ),
      ),
    );
  }
}
