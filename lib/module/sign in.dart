//جايبه من علي النت ممكن احتاجه بعدين

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// void signinwithemailandpassword(String email,String password)
// async {
//   try{
//     UserCredential usercredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password
//     );
//     User?user=FirebaseAuth.instance.currentUser;
//     if(user!=null && !user.emailVerified)
//     {
//       await user.sendEmailVerification();
//     }
//     print('user cred ${usercredential}');
//     Fluttertoast.showToast(
//       msg: "sign up with Email and passwowrd",
//       textColor: Colors.white,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       backgroundColor: Colors.indigo,);
//     '${usercredential.user!.email}\n';
//     '${usercredential.user!.metadata.lastSignInTime}\n';
//   }on FirebaseAuthException catch(error)
//   {
//     if(error.code=='weak password')
//     {
//       Fluttertoast.showToast(
//         msg: "the password provided is too weak",
//         textColor: Colors.white,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.indigo,);
//     }else if (error.code=='email already in use')
//     {
//       Fluttertoast.showToast(
//         msg: "the account already exists for that email ",
//         textColor: Colors.white,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.indigo,);
//     }
//   }catch(error)
//   {
//     Fluttertoast.showToast(
//       msg: "${error.toString()} ",
//       textColor: Colors.white,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       backgroundColor: Colors.indigo,);
//   }
//
// }
// class regester_shopapp extends StatelessWidget {
//   var emailcontroller=TextEditingController();
//   var passwordcontroller=TextEditingController();
//   var namecontroller=TextEditingController();
//   var phonecontroller=TextEditingController();
//   var formkey=GlobalKey<FormState>();
//
//   // const regester_shopapp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Form(key: formkey,
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//
//                 children: [
//
//                   Text('Register',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.blue),),
//                   SizedBox(height: 10,),
//
//                   Text('Complete this form',style: TextStyle(fontSize: 20,color: Colors.grey),),
//                   SizedBox(height: 20,),
//                   TextFormField(controller: namecontroller,
//                     decoration:InputDecoration(
//                       // prefixIcon:Icon(Icons.username),
//                       labelText:'User Name' ,
//                       border:OutlineInputBorder(),
//                     ) ,
//                     validator: (value){
//                       if (value!.isEmpty)
//                         return ('name must not be empty');
//                     },),
//                   SizedBox(height: 20,),
//                   TextFormField(controller: emailcontroller,
//                     decoration:InputDecoration(
//                       prefixIcon:Icon(Icons.email),
//                       labelText:'Email' ,
//                       border:OutlineInputBorder(),
//                     ) ,
//                     validator: (value){
//                       if (value!.isEmpty)
//                         return ('amail address must not be empty');
//                     },),
//                   SizedBox(height: 20,),
//                   TextFormField(controller: passwordcontroller,
//                     decoration:InputDecoration(
//                       prefixIcon:Icon(Icons.lock_outline),
//                       labelText:'password' ,
//                       border:OutlineInputBorder(),
//                     ) ,
//                     validator: (value){
//                       if (value!.isEmpty)
//                         return ('password must not be empty');
//                     },),
//                   SizedBox(height: 20,),
//                   TextFormField(controller: phonecontroller,
//                     decoration:InputDecoration(
//                       prefixIcon:Icon(Icons.phone),
//                       labelText:'Phone Number' ,
//                       border:OutlineInputBorder(),
//                     ) ,
//                     validator: (value){
//                       if (value!.isEmpty)
//                         return ('phone must not be empty');
//                     },),
//                   SizedBox(height: 20,),
//                   MaterialButton(onPressed: ()
//                   {
//                     if(formkey.currentState!.validate())
//                     {
//                     }
//                   },
//                     child: Text('REGISTER'),color: Colors.blue,)
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
