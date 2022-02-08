import 'package:flutter/material.dart';
import 'package:flutter_meme_generator/providers/templates_provider.dart';
import 'package:flutter_meme_generator/widgets/custom_tile.dart';
import 'package:provider/provider.dart';

class InfiniteScrollView extends StatelessWidget {
  const InfiniteScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TemplatesProvider>(context);

    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 0),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: CustomTile(
                  src: provider.memeDataList[index].url,
                  title: provider.memeDataList[index].name));
        },
        itemCount: provider.memeDataList.length);
  }
}
