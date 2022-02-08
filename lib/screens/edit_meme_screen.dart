import 'package:flutter/material.dart';
import 'package:flutter_meme_generator/providers/templates_provider.dart';
import 'package:flutter_meme_generator/widgets/meme_editor_toolbox.dart';

class EditMemeScreen extends StatelessWidget {
  final String src;
  final String name;

  const EditMemeScreen({Key? key, required this.src, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meme editor'),
          backgroundColor: TemplatesProvider.appColor,
        ),
        body: ColoredBox(
          color: const Color.fromRGBO(45, 48, 51, 1),
          child: Column(
            children: [
              Expanded(child: Image.network(src)),
              const MemeEditorToolbox()
            ],
          ),
        ));
  }
}
