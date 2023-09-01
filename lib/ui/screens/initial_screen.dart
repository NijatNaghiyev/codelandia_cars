import 'package:codelandia_cars/service/cars_repo.dart';
import 'package:codelandia_cars/ui/screens/main_screen.dart';
import 'package:codelandia_cars/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CarsRepo.fetchData().then((value) => carsList = value);
    return Scaffold(
      backgroundColor: const Color(0xFF282C34),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 26, horizontal: 26),
                    child: Text(
                      'Easy way to buy\nyour dream car',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 42,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      textAlign: TextAlign.left,
                      'By using the car, you can move quickly from one place to another  in your daily life.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/Red-car-on-transparent-background-PNG-removebg-preview.png',
            ),
            FilledButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
