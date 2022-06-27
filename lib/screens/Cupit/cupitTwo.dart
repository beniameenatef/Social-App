import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/model/cupitfirebase.dart';
import 'package:socialapp/model/model%20add%20post.dart';
import 'package:socialapp/model/model%20create%20Firestore.dart';
import 'package:socialapp/screens/Cupit/stateTwo.dart';
import 'package:socialapp/screens/modules/addpost.dart';
import 'package:socialapp/screens/modules/chat.dart';
import 'package:socialapp/screens/modules/home.dart';
import 'package:socialapp/screens/modules/setting.dart';
import 'package:socialapp/screens/modules/users.dart';
import 'package:socialapp/screens/style/icon_broken.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class socialappcupitTwo extends Cubit<socialappTwostate> {


  socialappcupitTwo() :super(socialappintialstateTwo());


  static socialappcupitTwo get(context) => BlocProvider.of(context);

  int currentindex = 0;
  List<Widget>screen =
  [
    homeScreen(),
    chatscrean(),
    addpost(),
    usersscrean(),
    settingscreen(),
  ];
  List<BottomNavigationBarItem>bottomnavigationitem =
  [
    BottomNavigationBarItem(icon: Icon(IconBroken.Home,), label: 'Home',),
    BottomNavigationBarItem(icon: Icon(IconBroken.Chat), label: 'Chats'),
    BottomNavigationBarItem(
        icon: Icon(IconBroken.Add_User, size: 30,), label: 'Add Post'),
    BottomNavigationBarItem(icon: Icon(IconBroken.User), label: 'Users'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Setting), label: 'Setting')
  ];


  void changepages(int index, context) {
    currentindex = index;
    emit(socialBottomNavigationState());
    Widget page = homeScreen();
    switch (index) {
      case 1:
        page = chatscrean();
        break;
      case 2:
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => addpost()),);
        index = 0;

        break;
      case 3:
        page = usersscrean();
        break;
      case 4:
        page = settingscreen();
        break;
    }
    // Navigator.push(context,
    //   MaterialPageRoute(builder: (context) =>  page),) ;


    // setState(() {
    //   _currentIndex = index;
    //   print(index);
    // });

    //   if(index == 1)
    //     getchat();
    //   if(index == 2)
    //     getusers();
    //   if(index == 3)
    //     getsetting();
    //   if(index == 4)
    //      getsetting();
    // }
    // void getchat(){}
    // void getusers(){}
    // void getsetting(){}
  }


  // void getUserData() {
  //   emit(socialgetdataloadingstate());
  //
  //   FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
  //     //print(value.data());
  //     userModel = socialusermodel.fromJson(value.data()!);
  //      emit(socialgetdatasucessstate());
  //   }).catchError((error) {
  //     print(error.toString());
  //      emit(socialgetdataerrorstate(error.toString()));
  //   });
  // }


  File? profileimage;
  File? coverimage;
  var Picker = ImagePicker();


  Future<void> getprofileImage() async {
    emit(socialgetimageprofileloadingstate());
    final ImagePickedFile = await Picker.getImage(
        source: ImageSource.gallery);
    if (ImagePickedFile != null) {
      profileimage = File(ImagePickedFile.path);

      emit(socialgetimageprofileimagesucessstate());
    } else {
      print('no image selected ');
      emit(socialgetimageprofileimageerrorstate());
    }
  }


  Future<void> getcoverImage() async {
    final ImagecoverPickedFile = await Picker.getImage(
        source: ImageSource.camera);
    emit(socialgetimagecoverloadingstate());
    if (ImagecoverPickedFile != null) {
      coverimage = File(ImagecoverPickedFile.path);
      emit(socialgetimagecoverimagesucessstate());
    } else {
      print('no image sellected');
      emit(socialgetimagecoverimageerrorstate());
    }
  }

// String profileimageurl='';
//   void uploadprofileimage()
//   {
//     firebase_storage.FirebaseStorage.instance
//         .ref()
//         .child('users/${Uri.file(profileimage!.path).pathSegments.last}')
//         .putFile(profileimage!).then((value)
//     {
//       value.ref.getDownloadURL();
//
//     }).then((value)
//     {
//       // profileimageurl=value.toString();
//
//
//       emit(socialimagesucessstate());
//
//     }).catchError((error)
//     {
//       emit(socialimageerrorstate("${error.toString()}"));
//     }).catchError((error)
//     {
//
//     });}
  // void updateUser({
  //   String? name,
  //   String? phone,
  //   String? bio,
  //   String? cover,
  //   String? profile,
  // }) {
  //   socialusermodel model = socialusermodel(
  //     name: name,
  //     phone: phone,
  //     bio: bio,
  //     email: userModel.email,
  //     coverimage: cover ?? userModel.coverimage,
  //     profileimage: profile ?? userModel.profileimage,
  //     uid: userModel.uid,
  //   );
  //
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userModel.uid)
  //       .update(model.ToMap())
  //       .then((value) {
  //
  //     getUserData();
  //   }).catchError((error) {
  //      emit(socialupdateusererrorstate(error.toString()));
  //   });
  // }


  void uploadProfileImage({
    @required String ?name,
    @required String ?phone,
    @required String ?bio,
  }) {
    emit(socialuseruploadprofileloadingstate());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(profileimage!.path)
        .pathSegments
        .last}')
        .putFile(profileimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadProfileImageSuccessState());
        print(value);
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
      }).catchError((error) {
        emit(socialuseruploadprofilesucessstate());
      });
    }).catchError((error) {
      emit(socialuseruploadprofileerrorstate(error.toString()));
    });
  }

  void uploadCoverImage({
    @required String ?name,
    @required String ?phone,
    @required String ?bio,
  }) {
    emit(socialuseruploadcoverloadingstate());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(coverimage!.path)
        .pathSegments
        .last}')
        .putFile(coverimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadCoverImageSuccessState());
        print(value);
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          cover: value,
        );
      }).catchError((error) {
        emit(socialuseruploadcoversucessstate());
      });
    }).catchError((error) {
      emit(socialuseruploadcovererrorstate(error.toString()));
    });
  }


  socialusermodel userModel = socialusermodel();

  void getUserData() {
    emit(SocialGetDataToUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      //print(value.data());
      userModel = socialusermodel.fromJson(value.data()!);
      emit(SocialGetDataToUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetDataToUserErrorState(error.toString()));
    });
  }


  void updateUser({
    @required String ?name,
    @required String ?phone,
    @required String ?bio,
    String ?cover,
    String ?image,
  }) {
    socialusermodel model = socialusermodel(
      name: name,
      phone: phone,
      bio: bio,
      email: userModel.email,
      coverimage: cover ?? userModel.coverimage,
      profileimage: image ?? userModel.profileimage,
      uid: userModel.uid,
      // isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uid)
        .update(model.ToMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(SocialUpdateUserErrorState(error.toString()));
    });
  }

//   void updateUserImages({
//   @required String name,
//   @required String phone,
//   @required String bio,
// })
//   {
//     emit(SocialUserUpdateLoadingState());
//
//     if(coverImage != null)
//     {
//       uploadCoverImage();
//     } else if(profileImage != null)
//     {
//       uploadProfileImage();
//     } else if (coverImage != null && profileImage != null)
//     {
//
//     } else
//       {
//         updateUser(
//           name: name,
//           phone: phone,
//           bio: bio,
//         );
//       }
//   }


  File? postimage;



  Future<void> getpostImage() async {
    emit(SocialGetPostImageLoadingState());
    final ImagePickedFile = await Picker.getImage(
        source: ImageSource.gallery);
    if (ImagePickedFile != null) {
      postimage = File(ImagePickedFile.path);

      emit(SocialGetPostImageSuccessState());
    } else {
      print('no image selected ');
      emit(SocialGetPostImageErrorState(toString()));
    }
  }

  void removeimage() {
    postimage =null ;
    emit(SocialRemovePostImageSuccessState());
  }

  void uploadpostimage({
    String?datatime,
    String?text,}) {
    emit(SocialCreatePostImageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri
        .file(postimage!.path)
        .pathSegments
        .last}')
        .putFile(postimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createpost(
            datatime:datatime ,
            text:text,
            postimage: value,

        );
        emit(SocialCreatePostImageSuccessState());
      }).catchError((error) {
        emit(SocialCreatePostImageErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(SocialCreatePostImageErrorState(error.toString()));
    });
  }

  void createpost({
    @required String?datatime,
    @required String?text,
   String?postimage,}) {
    emit(SocialCreatePostLoadingState());
    postmodel model = postmodel(
      name: userModel.name,
      uid: userModel.uid,
      image: userModel.profileimage,
      datatime: datatime,
      text: text,
      postimage: postimage ?? '',

    );
    FirebaseFirestore.instance.collection('posts')
        .add(model.ToMap()).then((value) {
      emit(SocialCreatePostSuccessState());

    }).catchError((error)
    {
      emit(SocialCreatePostErrorState(error));

    });
  }
  List <postmodel>posts=[];
  void getposts()
  {
    emit(SocialGetPostImageLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value)
    {
      emit(SocialGetPostsSuccessState());
      value.docs.forEach((element)
      {
        posts.add(postmodel.fromJson(element.data()));
      });
    }).catchError((error)
    {
      emit(SocialGetPostsErrorState(error));

    });
  }
}