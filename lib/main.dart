import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/model/cupitfirebase.dart';
import 'package:socialapp/model/statesfirebase.dart';
import 'package:socialapp/module/login.dart';
import 'package:socialapp/screens/Cupit/cupitTwo.dart';
import 'package:socialapp/screens/modules/bottomnavigation.dart';
import 'package:socialapp/shared/sharedPrefrence.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => {}).catchError((error)
  {
    print(' error is  ${error.toString()}');
  });

  //WidgetsFlutterBinding.ensureInitialized();

  // SharedPreferences.getInstance();
  await cacheHelper.init();
  var uid = cacheHelper.getData(key:"uid");
  // final Future<User> user = getData(uid);

  Widget widget;

   if(uid!=null)
   {
     widget=
         socialApp();
     print(' this is uid value ${uid}');
   }
   else
     {
       widget=loginsocialapp();
     }
   runApp(MyApp(
     startWidget: widget,
   ));}
   class MyApp extends StatelessWidget {
   final Widget? startWidget;
   MyApp({ this.startWidget});
  @override
  Widget build(BuildContext context) {

    return
      MultiBlocProvider(providers:  [
        BlocProvider(
            create: (BuildContext context)=>socialappcupitOne()),
    BlocProvider(
        create: (BuildContext context)=>socialappcupitTwo()),


    ],

        // ..getuserdata(),
      child:
       MaterialApp(
      home:startWidget
       ) );
      }
    }




