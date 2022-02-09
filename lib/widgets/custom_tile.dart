import 'package:flutter/material.dart';
import 'package:flutter_meme_generator/screens/edit_meme_screen.dart';

class CustomTile extends StatelessWidget {
  final String src;
  final String title;
  final int width;
  final int height;

  const CustomTile(
      {Key? key,
      required this.src,
      required this.title,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    getRoute() {
      return MaterialPageRoute(
          builder: (context) => EditMemeScreen(
              src: src, name: title, width: width, height: height));
    }

    final tileSize = MediaQuery.of(context).size.width / 2 - 28;

    return SizedBox(
      height: tileSize,
      child: Card(
        child: InkWell(
          onTap: () => {Navigator.push(context, getRoute())},
          child: Row(children: [
            SizedBox(
                width: tileSize,
                height: tileSize,
                child: Image.network(
                  src,
                  fit: BoxFit.cover,
                )),
            const VerticalDivider(),
            SizedBox(
              width: tileSize,
              child: Text(title),
            )
          ]),
        ),
      ),
    );
  }
}
