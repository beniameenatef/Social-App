import 'package:flutter/cupertino.dart';

class socialusermodel
{
  String? name;
  String? email;
  String? phone;
  String? uid;
  String? bio;
  String? profileimage;
  String? coverimage;
  socialusermodel(
      // Map<String, dynamic> map,
      {
        this.name,
        this.email,
        this.phone,
        this.uid,
        this.bio,
        this.profileimage,
        this.coverimage,
      });
  socialusermodel.fromJson(Map<String,dynamic>json)
  {
    email=json['email'];
    name=json['name'];
    phone=json['phone'];
    uid=(json['uid'] ) ;
    bio=(json['bio'] ) ;

    profileimage=(json['profileimage'] ) ;
    coverimage=(json['coverimage'] ) ;
  }
  Map<String,dynamic>ToMap()
  {
  return
  {
  'name':name,
  'email':email,
  'phone':phone,
  'uid':uid,
  'uid':bio,
  'profileimage':profileimage,
  'coverimage':coverimage,
  };
  }
}

