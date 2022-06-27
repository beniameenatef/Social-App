//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:socialapp2/style/icon_broken.dart';
//
// class homescrean extends StatelessWidget {
//   const homescrean({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 200,
//                 child: Card(
//                   elevation: 8,
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                  // margin: EdgeInsets.all(8.0),
//                   child: Stack(
//                       alignment: AlignmentDirectional.bottomEnd,
//                       children:[
//                   Image(image: AssetImage("assets/images/image.jpg"),width: double.infinity,fit: BoxFit.fill,),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text('communicat with friends',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w800,
//                                 fontSize: 17,
//                               //color: Colors.white
//                             ),),
//                         )
//                 ])),
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 200,
//                 child: Card(
//                     elevation: 20,
//                     clipBehavior: Clip.antiAliasWithSaveLayer,
//                     // margin: EdgeInsets.all(8.0),
//                     child: Stack(
//                         children:[
//                           :BoxDecoration(image: Image(
//                             image: AssetImage("assets/images/image.jpg"),
//                           ),),
//                           CircleAvatar(
//                               child:
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text('communicat with friends',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w800,
//                                 fontSize: 17,
//                                 //color: Colors.white
//                               ),),
//                           )
//                         ])),
//               ),
//
//             ],),
//         ),
//       )
//     );
//   }
//
// }
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/screens/style/icon_broken.dart';


class homeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return  SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children:
              [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5.0,
                  margin: EdgeInsets.all(
                    8.0,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                                       Image(image: AssetImage("assets/images/image.jpg"),
                                         width: double.infinity,
                                         fit: BoxFit.fill,
                                         height: 200,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'communicate with friends',
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white ),),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => buildPostItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.0,
                  ),
                  itemCount:10,
                ),
              ],
            ),

        );


  }

  Widget buildPostItem() => Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: EdgeInsets.symmetric(
      horizontal: 8.0,
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage:AssetImage("assets/images/image2.jpg",)),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('beniameen atef',
                          style: TextStyle( fontWeight: FontWeight.bold,
                            height: 1.8,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                          size: 16.0,
                        ),
                      ],
                    ),
                    Text(
                      'january 21,2022 at 12:00 pm',
                      style: TextStyle(color: Colors.grey[400],fontSize: 11)
                      ),
                  ],
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              FlatButton(color: Colors.white,minWidth: 0,onPressed: (){}, child: Icon(
                Icons.more_horiz,
                size: 18.0,
              ),)
              // Button(
              //
              //   onPressed: () {},
              // ),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     vertical: 15.0,
          //   ),
          //   child: Container(
          //     width: double.infinity,
          //     height: 1.0,
          //     color: Colors.grey[300],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 12.0),
            child: Text(
              'Online Grammar and Writing Checker To Help You Deliver Impeccable'
                  ' Mistake-free Writing. Grammarly Has a Tool For Just About Every Kind Of Writing You Do.'
                  ' Try It Out For Yourself! Easily Improve Any Text. Find and Add Sources Fast. Fix Punctuation Errors',
              style: TextStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5.0,
              top: 4.0,
            ),
            child: Container(
              width: double.infinity,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 6.0,
                    ),
                    child: Container(
                      height: 21.0,
                      child: MaterialButton(
                        onPressed: () {},
                        minWidth: 1.0,
                        padding: EdgeInsets.zero,
                        child: Text(
                          '#software',
                          style:
                              TextStyle(color:Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 6.0,
                    ),
                    child: Container(
                      height: 22.0,
                      child: MaterialButton(
                        onPressed: () {},
                        minWidth: 1.0,
                        padding: EdgeInsets.zero,
                        child: Text(
                          '#flutter',
                          style:TextStyle(color:Colors.blue)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
            Container(
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  4.0,
                ),
                image: DecorationImage(
                  image:  AssetImage("assets/images/image.jpg"),fit: BoxFit.fill,),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start:8.0),
                  child: InkWell(
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Heart,
                          size: 19.0,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '0',
                          style:TextStyle(color: Colors.blueGrey[700],fontSize: 13),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end:8.0),
                  child: InkWell(
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Chat,
                          size: 19.0,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '0 comment',
                          style: TextStyle(color: Colors.blueGrey[700],fontSize: 13),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 7.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Row(
            children: [
              InkWell(
                child: Row(
                  children: [
                    Icon(
                      IconBroken.Heart,
                      size: 23.0,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Like',
                      style: TextStyle(),
                    ),

                  ],
                ),
                onTap: () {},
              ),
              SizedBox(width: 20,),
              InkWell(
                child: Row(
                  children: [
                    Icon(
                      IconBroken.Send,
                      size: 23.0,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Share',
                      style: TextStyle(),
                    ),

                  ],
                ),
                onTap: () {},
              ),
              Spacer(),
              InkWell(
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 18.0,
                        backgroundImage: AssetImage('assets/images/image.jpg')
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                        'write a comment ...',
                        style:
                        TextStyle(color: Colors.blueGrey[700],)
                    ),
                  ],
                ),
                onTap: () {},
              ),



            ],
          ),
        ],
      ),
    ),
  );
}