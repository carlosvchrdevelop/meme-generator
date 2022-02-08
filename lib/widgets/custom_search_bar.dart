import 'package:flutter/material.dart';
import 'package:flutter_meme_generator/providers/templates_provider.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TemplatesProvider>(context);
    return Container(
      width: double.infinity,
      height: 40,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(500)),
          color: Colors.white),
      child: Center(
        child: TextField(
          controller: provider.searchController,
          onChanged: (e) => {provider.setFilter()},
          decoration: const InputDecoration(
              hintText: 'Search for something',
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
