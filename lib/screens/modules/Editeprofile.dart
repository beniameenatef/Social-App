//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:socialapp/screens/Cupit/cupitTwo.dart';
// import 'package:socialapp/screens/models/stateTwo.dart';
// import 'package:socialapp/screens/style/icon_broken.dart';
//
// class EditProfileScreen extends StatelessWidget {
//   var nameController = TextEditingController();
//   var phoneController = TextEditingController();
//   var bioController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<newappCupit, socialappNavappstate>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var userModel = newappCupit.get(context).userModel;
//         var   newprofileimage = newappCupit.get(context).profileimage;
//         var newcoverimage = newappCupit.get(context).coverimage;
//
//         nameController.text = userModel.name!;
//         phoneController.text = userModel.phone!;
//         bioController.text = userModel.bio!;
//
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Edit Profile',),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   newappCupit.get(context).updateUser(
//                     name: nameController.text,
//                     phone: phoneController.text,
//                     bio: bioController.text); },
//
//                child:Text('Update') ,
//               ),
//               SizedBox(
//                 width: 15.0,
//               ),
//             ],
//           ),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   if (state is socialupdateuserloadingstate)
//                     LinearProgressIndicator(),
//                   if (state is socialupdateuserloadingstate)
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                   Container(
//                     height: 190.0,
//                     child: Stack(
//                       alignment: AlignmentDirectional.bottomCenter,
//                       children: [
//                         Align(
//                           child: Stack(
//                             alignment: AlignmentDirectional.topEnd,
//                             children: [
//                               Container(
//                                 height: 140.0,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//
//         // image:     Image(
//         // image: newcoverimage == null
//         // ?AssetImage("assets/images/image.jpg")
//         // as ImageProvider
//         //     : FileImage(newcoverimage),
//         // fit: BoxFit.cover,
//         // ),,
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(
//                                       4.0,
//                                     ),
//                                     topRight: Radius.circular(
//                                       4.0,
//                                     ),
//                                   ),
//
//
//                                 ),
//                               ),
//                               IconButton(
//                                 icon: CircleAvatar(
//                                   radius: 20.0,
//                                   child: Icon(
//                                     IconBroken.Camera,
//                                     size: 16.0,
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   newappCupit.get(context).getcoverImage();
//                                 },
//                               ),
//                             ],
//                           ),
//                           alignment: AlignmentDirectional.topCenter,
//                         ),
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 64.0,
//                               backgroundColor:
//                               Theme.of(context).scaffoldBackgroundColor,
//                               // child: CircleAvatar(
//                               //   radius: 60.0,
//                               //   backgroundImage: newprofileimage == null
//                               //       ? AssetImage(
//                               //     '',
//                               //   )
//                               //       : FileImage(newprofileimage),
//                               // ),
//                             ),
//                             IconButton(
//                               icon: CircleAvatar(
//                                 radius: 20.0,
//                                 child: Icon(
//                                   IconBroken.Camera,
//                                   size: 16.0,
//                                 ),
//                               ),
//                               onPressed: () {
//                                 newappCupit.get(context).getprofileImage();
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   if (newappCupit.get(context).profileimage != null ||
//                       newappCupit.get(context).coverimage != null)
//                     Row(
//                       children: [
//                         if (newappCupit.get(context).profileimage != null)
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 OutlinedButton( onPressed: () {
//                                   newappCupit.get(context).uploadProfileImage(
//                                     name: nameController.text,
//                                     phone: phoneController.text,
//                                     bio: bioController.text,
//                                   );
//                                 },
//
//                                   child:Text( 'upload profile'),
//                                 ),
//                                 if (state is socialupdateuserloadingstate)
//                                   SizedBox(
//                                     height: 5.0,
//                                   ),
//                                 if (state is socialupdateuserloadingstate)
//                                   LinearProgressIndicator(),
//                               ],
//                             ),
//                           ),
//                         SizedBox(
//                           width: 5.0,
//                         ),
//                         if (newappCupit.get(context).coverimage != null)
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 OutlinedButton( onPressed: () {
//                                   newappCupit.get(context).uploadCoverImage(
//                                     name: nameController.text,
//                                     phone: phoneController.text,
//                                     bio: bioController.text,
//                                   );
//                                 },
//
//                                   child:Text( 'upload cover'),
//                                 ),
//                                 if (state is socialupdateuserloadingstate)
//                                   SizedBox(
//                                     height: 5.0,
//                                   ),
//                                 if (state is socialupdateuserloadingstate)
//                                   LinearProgressIndicator(),
//                               ],
//                             ),
//                           ),
//                       ],
//                     ),
//                   if (newappCupit.get(context).profileimage != null ||
//                       newappCupit.get(context).coverimage != null)
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                   TextFormField(
//                     controller: nameController ,
//                     validator: (value){
//                       if (value!.isEmpty)
//                         return ('name must not be empty');
//                     },
//
//                     decoration:InputDecoration(
//                       // prefixIcon:Icon(Icons.email),
//                       labelText:"${TextInputType.name}" ,
//
//                       prefix: Icon(IconBroken.User),
//
//                       border:OutlineInputBorder(),),),
//
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   TextFormField(
//                     controller: bioController ,
//                     // tybe: TextInputType.text,
//
//                     validator: (value){
//                       if (value!.isEmpty)
//                         return ('bio must not be empty');
//                     },
//                     decoration:InputDecoration(
//                       prefixIcon:Icon(
//                           IconBroken.Info_Circle),
//                       labelText:"bio" ,
//
//                       border:OutlineInputBorder(),),),
//
//
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   TextFormField(
//                     controller: phoneController,
//                     // type: TextInputType.phone,
//                     validator: (value){
//         if (value!.isEmpty)
//         return ('phone must not be empty');
//
//
//                       return null;
//                     },
//         decoration:InputDecoration(
//         prefixIcon:Icon(
//         IconBroken.Call),
//         labelText:"Phone" ,
//
//         border:OutlineInputBorder(),),),
//
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }