import 'package:codelandia_cars/constant/car_images.dart';
import 'package:codelandia_cars/model/car_model.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../widgets/product_card.dart';
import '../widgets/product_screen_features.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.car});
  final CarModel car;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282C34),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildProductScreenAppBar(context),
              Image.network(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.3,
                fit: BoxFit.cover,
                kCarImagesList[carsList.indexOf(widget.car)],
              ),
              const SizedBox(height: 20),
              Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.sizeOf(context).height * 0.5,
                ),
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.car.make.toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              Text(
                                '(4.5)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "A car with high specs that is rented at an affordable price",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Features',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          ProductScreenFeatures(
                            icon: Icons.event_seat,
                            title: 'Total capacity',
                            desc: '6 seats',
                          ),
                          ProductScreenFeatures(
                            icon: Icons.speed,
                            title: 'Highest speed',
                            desc: '200 km/h',
                          ),
                          ProductScreenFeatures(
                            icon: Icons.construction,
                            title: 'Engine output',
                            desc: '500 HP',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.sizeOf(context).height * 0.1,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  '\$44,999',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FilledButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 46),
                  child: Text(
                    'Buy now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildProductScreenAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: kIconBackgroundColor,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
          const Text(
            'Car Details',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          CircleAvatar(
            radius: 26,
            backgroundColor: kIconBackgroundColor,
            child: IconButton(
              onPressed: () {
                setState(() {});
                if (favoritesList.contains(widget.car)) {
                  favoritesList.remove(widget.car);
                } else {
                  favoritesList.add(widget.car);
                }
              },
              icon: Icon(
                favoritesList.contains(widget.car)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
