import 'dart:convert';

Placeholder1 placeholderModelFromJson(String str) =>
  Placeholder1.fromJson(json.decode(str));

String placeholderModelToJson(Placeholder1 data) => json.encode(data.toJson());

class Placeholder1{
   
  int userId;
  int id;
  String title;
  String body;
  

  Placeholder1({
    this.userId,
    this.id,
    this.title,
    this.body
    
  });

  factory Placeholder1.fromJson(Map<String, dynamic> json) => new Placeholder1(
        userId: json["userId"],
        id    : json["id"],
        title : json["title"],
        body  : json["body"]
        
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id"    : id,
        "title" : title,
        "body"  : body
        
      };

}