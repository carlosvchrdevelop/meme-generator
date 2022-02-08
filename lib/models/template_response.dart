import 'dart:convert';

class TemplateResponse {
  TemplateResponse({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory TemplateResponse.fromJson(String str) =>
      TemplateResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TemplateResponse.fromMap(Map<String, dynamic> json) =>
      TemplateResponse(
        success: json["success"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data.toMap(),
      };
}

class Data {
  Data({
    required this.memes,
  });

  List<Meme> memes;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        memes: List<Meme>.from(json["memes"].map((x) => Meme.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "memes": List<dynamic>.from(memes.map((x) => x.toMap())),
      };
}

class Meme {
  Meme({
    required this.id,
    required this.name,
    required this.url,
    required this.width,
    required this.height,
    required this.boxCount,
  });

  String id;
  String name;
  String url;
  int width;
  int height;
  int boxCount;

  factory Meme.fromJson(String str) => Meme.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meme.fromMap(Map<String, dynamic> json) => Meme(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
        boxCount: json["box_count"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "url": url,
        "width": width,
        "height": height,
        "box_count": boxCount,
      };
}
