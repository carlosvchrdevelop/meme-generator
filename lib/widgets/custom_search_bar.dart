import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(500)),
          color: Colors.white),
      child: const Center(
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Search for something', prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}
