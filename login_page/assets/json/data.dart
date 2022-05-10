
import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;


class data {
  int? id;
  String? first_name;
  String? last_name;
  String? image_url;
  String? email;

  data({
    this.id,
    this.first_name,
    this.last_name,
    this.image_url,
    this.email
  });

  data.fromJson(Map<String, dynamic>json){
    id = json["id"];
    first_name = json["first_name"];
    last_name = json["last_name"];
    image_url = json["avatar"];
    email = json["email"];

  }

    Future <List<data>>ReadJsonFile() async{

    final jsondata = await rootBundle.rootBundle.loadString("json/data.json");
    final list = json.decode(jsondata) as List<dynamic>;

    

    return list.map((e) => data.fromJson(e)).toList();

  }





}
