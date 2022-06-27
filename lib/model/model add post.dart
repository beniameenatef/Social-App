import 'package:flutter/cupertino.dart';

class postmodel
{
  String? name;
  String? uid;
  String? image;
  String? text;
  String? datatime;
  String? postimage;
  postmodel(
      // Map<String, dynamic> map,
          {
        this.name,
        this.uid,
        this.image,
        this.text,
        this.datatime,
        this.postimage,
      });
  postmodel.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    image=json['image'];
    uid=(json['uid'] ) ;
    text=(json['text'] ) ;
    datatime=(json['datatime'] ) ;
    postimage=(json['postimage'] ) ;

  }
  Map<String,dynamic>ToMap()
  {
    return
      {
        'name':name,
        'image':image,
        'uid':uid,
        'text':text,
        'datatime':datatime,
        'postimage':postimage,
      };
  }
}

