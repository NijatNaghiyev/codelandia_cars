import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 32,
          backgroundImage: NetworkImage(
            'https://pyxis.nymag.com/v1/imgs/3b7/ca7/5fd3353737d602a5a1caa3fce92cb33b39-rick-morty.1x.rsquare.w1400.jpg',
          ),
        ),
        title: const Text(
          'Welcome ✌️',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        subtitle: const Text(
          'Rick Sanchez',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: Image.network(
            width: 30,
            'https://cdn-icons-png.flaticon.com/512/5035/5035563.png',
          ),
        ),
      ),
    );
  }
}
