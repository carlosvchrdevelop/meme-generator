import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sticker_view/stickerview.dart';

import '../models/template_response.dart';

class TemplatesProvider extends ChangeNotifier {
  static const appColor = Colors.amber;
  static const appColorDark = Color.fromRGBO(199, 146, 0, 1);

  List<Sticker> stickers = [];

  TextEditingController searchController = TextEditingController();
  List<Meme> memeDataList = [];
  String _filter = "";

  void addSticker(Sticker sticker) {
    stickers.add(sticker);
    notifyListeners();
  }

  void setFilter() {
    _filter = searchController.text;
    notifyListeners();
  }

  String getFilter() {
    return _filter;
  }

  TemplatesProvider() {
    getOnDisplayTemplates();
  }

  getOnDisplayTemplates() async {
    var url = Uri.https('api.imgflip.com', 'get_memes', {});

    final response = await http.get(url);
    final decodedData = TemplateResponse.fromJson(response.body);
    memeDataList = decodedData.data.memes;
    notifyListeners();
  }
}
