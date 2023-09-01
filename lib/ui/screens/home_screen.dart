import 'package:flutter/material.dart';

import '../../service/cars_repo.dart';
import '../widgets/car_model_circle.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/product_card.dart';
import '../widgets/text_field_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        color: Colors.black,
        onRefresh: () async {
          setState(() {});
          return CarsRepo.fetchData().then((value) => carsList = value);
        },
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAppBar(),
              const TextFieldWidget(),
              const ListViewCarModel(),
              ProductCard(),
            ],
          ),
        ),
      ),
    );
  }
}
