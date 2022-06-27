import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/model/model%20create%20Firestore.dart';
import 'package:socialapp/model/statesfirebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class socialappcupitOne extends Cubit<socialappOnestate> {
  socialappcupitOne() : super(socialappinitialstateOne());
  static socialappcupitOne get(context)=>BlocProvider.of(context);

  // void signupwithemailandpassword({
  //   @required String? email,
  //   @required String? password,
  //   @required String? phone,
  //   @required String? name,
  // }) async {
  //   emit(socialRegisterlodingstate());
  //   try{
  //     UserCredential usercredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email!,
  //       password: password!,
  //     );
  //     User?user=FirebaseAuth.instance.currentUser;
  //
  //     if(user!=null && !user.emailVerified)
  //
  //     {
  //       await user.sendEmailVerification();
  //
  //     print('user cred ${usercredential}');
  //     Fluttertoast.showToast(
  //       msg: "sign up with Email and passwowrd",
  //       textColor: Colors.white,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: Colors.indigo,);
  //     '${usercredential.user!.email}\n';
  //     '${usercredential.user!.metadata.lastSignInTime}\n';
  //       emit(socialRegistersuccesstate());
  //
  //     }
  //   }
  //   on FirebaseAuthException catch(error)
  //   {
  //     emit(socialRegistererrorsstate(error.toString()));
  //     print('${error.toString()}');
  //     if(error.code=='weak password')
  //     {
  //       Fluttertoast.showToast(
  //         msg: "the password provided is too weak",
  //         textColor: Colors.white,
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         backgroundColor: Colors.indigo,);
  //     }
  //      else if  (error.code=='email-already-in-use')
  //     {
  //       Fluttertoast.showToast(
  //         msg: "the account already exists for that email ",
  //         textColor: Colors.white,
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         backgroundColor: Colors.indigo,);
  //     }
  //   }
  //   catch(error)
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
  // void login({
  //   @required String? email,
  //   @required String? password,
  // })
  // {
  //   emit(socialloginlodingstate());
  //
  //   FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email!, password: password!).then((value)
  //   {
  //     print(value.user!.email);
  //     print(value.user!.uid);
  //     emit(socialloginsuccesstate("${value.user}"));
  //

  //
  //   }).catchError((error){
  //     emit(socialloginerrorsstate( error.toString()));
  //     print('${error.toString()}');

  //   });
  // }
  void register({
    @required String? name,
    @required String? phone,
    @required String? email,
    @required String? password,
    @required String? uid,
  })
  {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!).then((value)
    {
      // print(value.user!.email);
      // print(value.user!.uid);
      createaccountuser(name: name,
          phone: phone,
          email: email,
          uid: value.user!.uid,
          password: password,
      );
      //emit(socialRegistersuccesstate());

      Fluttertoast.showToast(
                msg: "sign up with Email and passwowrd",
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.indigo,);
    }).catchError((error){
      emit(SocialRegisterErrorState( error.toString()));
      print('${error.toString()}');
      Fluttertoast.showToast(
                msg: "${error.toString()}",
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.indigo,);
    });
  }
  void userLogin({
    @required String? email,
    @required String ?password,
  }) {
    emit(SocialLogInLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email!,
      password: password!,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(SocialLogInSuccessState(value.user!.uid));
      Fluttertoast.showToast(
        msg: "login successfully",
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.indigo,
      );
    })
        .catchError((error)
    {
      emit(SocialLogInErrorState(error.toString()));
      Fluttertoast.showToast(
        msg: "false please again enter your email and password ",
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,);
    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  // void changePasswordVisibility() {
  //   isPassword = !isPassword;
  //   suffix =
  //   isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  //
  //   emit(SocialChangePasswordVisibilityState());
  // }

  UserCredential ?result;

  void createaccountuser({
    @required String? name,
    @required String? phone,
    @required String? email,
    @required String? password,
    @required String? uid,
  })
  {
    emit(SocialCreateAccountUserLoadingState());
    socialusermodel model= socialusermodel(
      email: email,
      name: name,
      phone: phone,
      uid: result!.user!.uid,
        );
    FirebaseFirestore.instance.collection('user')
        .doc(result!.user!.uid)
        .set(
        model.ToMap()).then((value)
    {
          emit(SocialCreateAccountUserSuccessState());
        }
  ).catchError((error){
      emit(SocialCreateAccountUserErrorState( error.toString()));
      print('${error.toString()}');

  });
  }

//   socialusermodel? modeluser;
//
//   void getuserdata()
// {
//   emit(socialgetuserlodingstate());
//   FirebaseFirestore.instance.collection('user').doc(uid).get().then((value)
//   {
//     // modeluser =socialusermodel.fromJson(value.data());
//
//     emit(socialgetusersuccesstate());
//   }).catchError((error)
//   {
//     emit(socialgetusererrorsstate(error.toString()));
//   });
// }


}


String uid='';

