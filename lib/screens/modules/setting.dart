import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/screens/Cupit/cupitTwo.dart';
import 'package:socialapp/screens/Cupit/stateTwo.dart';
import 'package:socialapp/screens/modules/newedit.dart';
import 'package:socialapp/screens/style/icon_broken.dart';

class settingscreen extends StatelessWidget {
  const settingscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => socialappcupitTwo(),
        child: BlocConsumer<socialappcupitTwo, socialappTwostate>(
            listener: (context, state) {},
            builder: (context, state) {
              var profileimagecupit = socialappcupitTwo.get(context).profileimage;
              var coverimagecupit = socialappcupitTwo.get(context).coverimage;
              // var userModel = newappCupit.get(context).userModel;
              // nameController.text = userModel.name!;
              // phoneController.text = userModel.phone!;
              // bioController.text = userModel.bio!;

              return Scaffold(
                // appBar: AppBar(leading: IconButton(onPressed: ()
                // {
                //   Navigator.pop(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) =>
                //               homeScreen()));
                // },icon: Icon(IconBroken.Arrow___Left_2),),),
                  body: Padding(
                      padding: const EdgeInsetsDirectional.all(2),
                      child: Column(
                        children: [
                          Stack(children: [
                            Image(
                              image: coverimagecupit == null
                                  ? AssetImage("assets/images/image.jpg")
                              as ImageProvider
                                  : FileImage(coverimagecupit),
                              width: double.infinity,
                              fit: BoxFit.fill,
                              height: 250,
                            ),
                            Container(
                                padding:
                                EdgeInsetsDirectional.only(top: 5, end: 5),
                                alignment: AlignmentDirectional.topEnd,
                                // child: CircleAvatar(
                                //     maxRadius: 20,
                                //     backgroundColor: Colors.black,
                                //     child: IconButton(
                                //       onPressed: () {
                                //         newappCupit
                                //             .get(context)
                                //             .getcoverImage();
                                //         // if (newappCupit.get(context).coverimage != null)
                                //         // {
                                //         newappCupit.get(context).uploadCoverImage();
                                //         //   // name: nameController.text,
                                //         //   // phone: phoneController.text,
                                //         //   // bio: bioController.text,
                                //         // );}
                                //       },
                                //       icon: Icon(IconBroken.Edit_Square),
                                //       iconSize: 25,
                                //     ))
                            ),
                            Container(
                                alignment: AlignmentDirectional.bottomCenter,
                                height: 290,
                                child: CircleAvatar(
                                    radius: 78,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 75,
                                      backgroundImage: profileimagecupit == null
                                          ? AssetImage(
                                          "assets/images/image2.jpg")
                                      as ImageProvider
                                          : FileImage(profileimagecupit),
                                    ))),
                            Container(
                              alignment: AlignmentDirectional.bottomCenter,
                              height: 290,
                              padding: EdgeInsetsDirectional.only(start: 60),
                              // child: CircleAvatar(
                              //     backgroundColor: Colors.black,
                              //     child: IconButton(
                              //       onPressed: () {
                              //         newappCupit
                              //             .get(context)
                              //             .getprofileImage();
                              //         if (newappCupit.get(context).profileimage != null)
                              //         {
                              //           newappCupit.get(context).uploadProfileImage(
                              //             // name: nameController.text,
                              //             // phone: phoneController.text,
                              //             // bio: bioController.text,
                              //           );}else
                              //         {
                              //           return null;
                              //         }
                              //         // newappCupit.get(context).uploadprofileimage();
                              //         // newappCupit.get(context).updateUser();
                              //       },
                              //       icon: Icon(IconBroken.Camera),
                              //       iconSize: 25,
                              //     )),
                            ),
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'beniameen atef',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'الرب راعيا فلا يعوزني شي',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500]),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      '100',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Post',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      '100',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Photo',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      '100',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Follwers',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      '100',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Following',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 5.0, end: 5),
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              color: Colors.blueGrey,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                newedit()));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Edit Your Profile'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(IconBroken.Edit_Square),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      )));
            }));
  }
}
