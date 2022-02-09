import 'package:flutter/material.dart';
import 'package:flutter_meme_generator/providers/templates_provider.dart';
import 'package:flutter_meme_generator/widgets/custom_tile.dart';
import 'package:provider/provider.dart';

import '../models/template_response.dart';

class InfiniteScrollView extends StatelessWidget {
  const InfiniteScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TemplatesProvider>(context);

    List<Meme> filteredList = provider.memeDataList
        .where((element) => element.name
            .toLowerCase()
            .contains(provider.getFilter().toLowerCase()))
        .toList();

    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 0),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: CustomTile(
                  src: filteredList[index].url,
                  title: filteredList[index].name,
                  width: filteredList[index].width,
                  height: filteredList[index].height));
        },
        itemCount: filteredList.length);
  }
}
