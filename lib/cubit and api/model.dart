
import 'dart:convert';

List<Apimodel> apimodelFromJson(String str) => List<Apimodel>.from(json.decode(str).map((x) => Apimodel.fromJson(x)));

String apimodelToJson(List<Apimodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Apimodel {
    int userId;
    int id;
    String title;
    String body;

    Apimodel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory Apimodel.fromJson(Map<String, dynamic> json) => Apimodel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
