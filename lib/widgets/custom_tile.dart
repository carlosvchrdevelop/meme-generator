import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String src;
  final String title;

  const CustomTile({Key? key, required this.src, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tileSize = MediaQuery.of(context).size.width / 2 - 28;

    return SizedBox(
      height: tileSize,
      child: Card(
        child: InkWell(
          onTap: () => {},
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
