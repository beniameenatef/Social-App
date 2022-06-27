
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/screens/Cupit/cupitTwo.dart';
import 'package:socialapp/screens/Cupit/stateTwo.dart';
import 'package:socialapp/screens/style/icon_broken.dart';

import 'home.dart';

class addpost extends StatelessWidget {
  const addpost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socialappcupitTwo, socialappTwostate>(
      listener: (context, state)
      {
        if(State is SocialCreatePostImageSuccessState)
        {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      homeScreen()),
                  (Route<dynamic>route)=>false);
        }
          // else if(State is SocialCreatePostErrorState)
        //   {
        //     Fluttertoast.showToast(
        //       msg: "failed",
        //       textColor: Colors.white,
        //       toastLength: Toast.LENGTH_SHORT,
        //       gravity: ToastGravity.BOTTOM,
        //       backgroundColor: Colors.indigo,
        //     );
        //   }


      },
      builder: (context, state) {
        var textcontroller = TextEditingController();

        var postimage = socialappcupitTwo
            .get(context)
            .postimage;




          return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white12,
        elevation: 0,
        leading: IconButton(onPressed: ()
      {

        Navigator.pop(context,
            MaterialPageRoute(
                builder: (context) =>
                    homeScreen()),
              // (Route<dynamic>route) => false,
        );


      },icon: Icon(IconBroken.Arrow___Left_2),color: Colors.black,),
        leadingWidth: 30,
        title: Text('Create Post',style: TextStyle(color: Colors.black),),
        actions: [TextButton(onPressed: ()
        {
          var now=DateTime.now();

          if(socialappcupitTwo.get(context).postimage == null)
          {

            socialappcupitTwo.get(context).createpost(
              datatime: now.toString(),
              text: textcontroller.text,
            );
          }else
          {
            socialappcupitTwo.get(context).uploadpostimage(
              text:textcontroller.text,
              datatime:now.toString(), );
          }

        }, child: Text('Post'))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            if(State is SocialCreatePostLoadingState)
              LinearProgressIndicator(),
            if(State is SocialCreatePostLoadingState)

              Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 25.0,
                    backgroundImage:AssetImage("assets/images/image2.jpg",)),
                SizedBox(
                  width: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('beniameen atef',
                      style: TextStyle( fontWeight: FontWeight.bold,
                        height: 1.8,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                        'public',
                        style: TextStyle(color: Colors.grey[400],fontSize: 11)
                    ),
                  ],
                ),
              ],
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextFormField(
                controller:textcontroller,
                decoration: InputDecoration
                  (

                  hintText: 'what is on your mind...',
                  hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w800),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

            Column(
              children: [
                if(socialappcupitTwo.get(context).postimage != null)
                  Stack(children: [
                   Image(
               image:  FileImage(postimage!),
                     width: double.infinity,
                     fit: BoxFit.fill,
                     height: 300,


                  ),
                  Container(
                      padding:
                      EdgeInsetsDirectional.only(top: 5, end: 5),
                      alignment: AlignmentDirectional.topEnd,
                      child: CircleAvatar(
                          maxRadius: 20,
                          backgroundColor: Colors.black,
                          child: IconButton(
                            onPressed: () {
                              socialappcupitTwo
                                  .get(context)
                                  .removeimage();

                            },
                            icon: Icon(IconBroken.Close_Square),
                            iconSize: 25,
                          ))),

                ],
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextButton(onPressed: ()
                      {

                        socialappcupitTwo.get(context).getpostImage();

                      },
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(IconBroken.Image),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Add Photo')
                            ],
                          )),
                    ),
                    Expanded(child: TextButton(onPressed: (){}, child: Text('# Tags')))
                  ],
                ),
              ],
            )


          ],
        ),
      ),

        );
}
    );
  }
}
