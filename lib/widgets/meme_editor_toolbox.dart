import 'package:flutter/material.dart';
import 'package:flutter_meme_generator/providers/templates_provider.dart';

class MemeEditorToolbox extends StatelessWidget {
  const MemeEditorToolbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                onTap: () {},
              ),
              MemeEditorButton(
                icon: Icons.save_alt_sharp,
                onTap: () {},
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
