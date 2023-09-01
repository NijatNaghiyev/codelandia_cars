import 'package:animations/animations.dart';
import 'package:codelandia_cars/ui/screens/product_screen.dart';
import 'package:flutter/material.dart';

import '../../constant/car_images.dart';
import '../../model/car_model.dart';
import '../../service/cars_repo.dart';

List<CarModel> favoritesList = [];
List<CarModel> carsList = [];

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    CarsRepo.fetchData().then((value) => carsList = value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24, left: 24),
                child: Text(
                  'Popular Car',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 24, right: 24),
                child: Text(
                  'View all',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: FutureBuilder(
              future: CarsRepo.fetchData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 300,
                      maxHeight: 500,
                      minWidth: MediaQuery.sizeOf(context).width,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return GridView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: carsList.length,
                    itemBuilder: (context, index) {
                      return OpenContainer(
                        transitionDuration: const Duration(milliseconds: 500),
                        closedBuilder: (context, action) => Card(
                          shape: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Image.network(
                                      height: 1000,
                                      width: 1000,
                                      fit: BoxFit.cover,
                                      kCarImagesList[index],
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 10,
                                      child: Container(
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {});
                                            if (favoritesList
                                                .contains(carsList[index])) {
                                              favoritesList
                                                  .remove(carsList[index]);
                                            } else {
                                              favoritesList
                                                  .add(carsList[index]);
                                            }
                                          },
                                          icon: Icon(
                                            favoritesList
                                                    .contains(carsList[index])
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${carsList[index].make.toUpperCase()} ${carsList[index].model}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '\$44,999',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        openBuilder: (context, action) => ProductScreen(
                          car: carsList[index],
                        ),
                      );
                    },
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  );
                }
                return const Text('error');
              },
            ),
          ),
        ],
      ),
    );
  }
}
