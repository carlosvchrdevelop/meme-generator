import 'package:flutter/material.dart';
import 'package:flutter_meme_generator/providers/templates_provider.dart';
import 'package:flutter_meme_generator/widgets/meme_editor_toolbox.dart';
import 'package:provider/provider.dart';
import 'package:sticker_view/stickerview.dart';

class EditMemeScreen extends StatelessWidget {
  final String src;
  final String name;
  final int width;
  final int height;

  const EditMemeScreen(
      {Key? key,
      required this.src,
      required this.name,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TemplatesProvider>(context);
    final double aspectRatio = width / height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meme editor'),
          backgroundColor: TemplatesProvider.appColor,
        ),
        body: ColoredBox(
          color: const Color.fromRGBO(45, 48, 51, 1),
          child: Column(
            children: [
              Expanded(
                  child: StickerView(
                      alignment: MainAxisAlignment.center,
                      backgroundImage: Image.network(src),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width / aspectRatio,
                      stickerList: provider.stickers)),
              const MemeEditorToolbox()
            ],
          ),
        ));
  }
}
