import 'package:flutter/material.dart';

class CarModelCircle extends StatelessWidget {
  const CarModelCircle({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.black,
            backgroundImage: NetworkImage(
              imageUrl,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewCarModel extends StatelessWidget {
  const ListViewCarModel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.sizeOf(context).width,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: const [
          CarModelCircle(
            imageUrl:
                'https://w0.peakpx.com/wallpaper/193/304/HD-wallpaper-mercedes-benz-logo-black-background-mercedes-emblem-mercedes-logo-on-a-black-background-car-brands.jpg',
            title: 'Mercedes',
          ),
          CarModelCircle(
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3_XEI-rRplpSPdrhSY0xnAK-jNDaeYVb_FA&usqp=CAU',
            title: 'BMW',
          ),
          CarModelCircle(
            imageUrl:
                'https://cdn3.vectorstock.com/i/1000x1000/55/02/tesla-brand-logo-car-symbol-black-and-white-design-vector-46155502.jpg',
            title: 'Tesla',
          ),
          CarModelCircle(
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjgB_PdtwSH9MIyaYsBVsjcOhYgPl5ax-5CQ&usqp=CAU',
            title: 'Lamborghini',
          ),
        ],
      ),
    );
  }
}
