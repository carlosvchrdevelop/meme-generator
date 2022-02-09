import 'dart:io';
import 'dart:typed_data';

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meme_generator/providers/templates_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sticker_view/stickerview.dart';

class MemeEditorToolbox extends StatelessWidget {
  const MemeEditorToolbox({Key? key}) : super(key: key);

  final SnackBar _savedImageSnack = const SnackBar(
    content: Text(
      'Saved into your gallery',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16),
    ),
    duration: Duration(seconds: 1),
  );

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TemplatesProvider>(context);
    return ColoredBox(
      color: TemplatesProvider.appColorDark,
      child: Column(
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            buttonPadding: const EdgeInsets.all(4),
            children: [
              MemeEditorButton(
                icon: Icons.share,
                onTap: () {},
              ),
              MemeEditorButton(
                icon: Icons.textsms_sharp,
                onTap: () {},
              ),
              MemeEditorButton(
                icon: Icons.text_fields_outlined,
                onTap: () {
                  provider.addSticker(Sticker(
                      child: BorderedText(
                          strokeWidth: 4.0,
                          child: const Text(
                            'Text',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              decoration: TextDecoration.none,
                              decorationColor: Colors.black,
                            ),
                          )),
                      id: '${DateTime.now().millisecondsSinceEpoch}',
                      isText: true));
                },
              ),
              MemeEditorButton(
                icon: Icons.save_alt_sharp,
                onTap: () async {
                  ScaffoldMessenger.of(context).showSnackBar(_savedImageSnack);
                  Uint8List? imageData =
                      await StickerView.saveAsUint8List(ImageQuality.high);
                  if (imageData != null) {
                    var imageName =
                        DateTime.now().microsecondsSinceEpoch.toString();
                    var appDocDir = await getApplicationDocumentsDirectory();
                    String imagePath = appDocDir.path + imageName + '.png';
                    File imageFile = File(imagePath);
                    imageFile.writeAsBytesSync(imageData);
                    GallerySaver.saveImage(imagePath);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class MemeEditorButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  const MemeEditorButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: IconButton(
        padding: const EdgeInsets.all(22),
        iconSize: 28,
        icon: Icon(icon),
        color: Colors.white,
        onPressed: () => onTap(),
        splashRadius: 36,
      ),
    );
  }
}
