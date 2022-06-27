// import 'dart:html';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:socialapp2/models/stateTwo.dart';
// class ImageCupit extends Cubit<socialappNavappstate>
// {
//   ImageCupit():super(newappintialstate());
//   static ImageCupit get(context)=>BlocProvider.of(context);
//
//   File? image;
//   var Picker=ImagePicker();
//   Future<void>getImage()
//   async {
//     final ImagePickeFile= await Picker.getImage(
//         source: ImageSource.gallery);
//     if(ImagePickeFile !=null)
//     {
//       image=File(ImagePickeFile.path);
//     }else
//     {
//       print('no image selected ');
//     }}
// }
