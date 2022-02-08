import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/template_response.dart';

class TemplatesProvider extends ChangeNotifier {
  static const appColor = Colors.amber;
  static const appColorDark = Color.fromRGBO(199, 146, 0, 1);

  TextEditingController searchController = TextEditingController();
  List<Meme> memeDataList = [];
  String filter = "";

  TemplatesProvider() {
    getOnDisplayTemplates();
  }

  getOnDisplayTemplates() async {
    var url = Uri.https('api.imgflip.com', 'get_memes', {});

    final response = await http.get(url);
    final decodedData = TemplateResponse.fromJson(response.body);
    memeDataList = decodedData.data.memes;
  }
}
