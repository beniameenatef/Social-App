
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socialapp/model/cupitfirebase.dart';
import 'package:socialapp/model/statesfirebase.dart';
import 'package:socialapp/module/Register..dart';
import 'package:socialapp/screens/modules/bottomnavigation.dart';
import 'package:socialapp/shared/sharedPrefrence.dart';

class loginsocialapp extends StatelessWidget {
  var formkey=GlobalKey<FormState>();
  var emaillogincontroller=TextEditingController();
  var passwordlogincontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create: (BuildContext context)=>socialappcupitOne(),
        child: BlocConsumer< socialappcupitOne,socialappOnestate>(
            listener: (context,state)
            {
              if(state is SocialLogInSuccessState)
              {
                cacheHelper.saveData(
                    key:"uid",
                    value:state.uid,
                ).then((value)
                {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => socialApp()),
                        (Route<dynamic> route) => false,
                  );
                });
              }

        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => homescreen()));
        // Navigator.push(
        // context,
        // MaterialPageRoute(builder: (context) => homescreen()),
        // Navigator.push( MaterialPageRoute(builder: (context)=>regester_shopapp()),
      },
            builder: (context,state){
              var cupitlogin= socialappcupitOne.get(context);
              return Scaffold(
                appBar: AppBar(backgroundColor: Colors.white10,
                  elevation: 0,),
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Form(
                          key: formkey,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,),),
                              SizedBox(height: 10,),
                              Text('besm allah msha2 allah',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey),),
                              SizedBox(height: 20,),
                              TextFormField(
                                controller: emaillogincontroller ,
                                validator: (value){
                                if (value!.isEmpty)
                                  return ('amail address must not be empty');
                                },
                                decoration:InputDecoration(prefixIcon:Icon(Icons.email),
                                  labelText:'email' ,
// labelStyle: TextStyle(color: Colors.orange,
//     fontWeight: FontWeight.bold,
//     fontSize: 20),
     border:OutlineInputBorder(),),),
                              SizedBox(height: 20,),
                              TextFormField(
                                controller: passwordlogincontroller ,
                                decoration:InputDecoration(prefixIcon:Icon(Icons.lock_outline),
                                  labelText:'password' ,
                                  border:OutlineInputBorder(),),
                                validator: (value){
                                if (value!.isEmpty)
                                  return ('password must not be empty');
                                },),
                              SizedBox(height: 20,),
//Container(width: double.infinity,
//color: Colors.blue,
    Center(
      child: ConditionalBuilder(
        condition: state is! SocialLogInLoadingState,
        builder: (context) => MaterialButton(textColor: Colors.black,color: Colors.blue,onPressed: ()
        {
          if(formkey.currentState!.validate()) {
            cupitlogin.userLogin(
                email: emaillogincontroller.text, password: passwordlogincontroller.text);
          }

          },
          child:Text("LOGIN",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),
          ),
        ), fallback: (BuildContext context) => Center(
          child: CircularProgressIndicator()),
      ),
    ),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Don\'t have an account?',style: TextStyle(
                                      fontWeight: FontWeight.bold),),
                                  TextButton(onPressed: ()
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => regestersocialapp()),
                                    );
// Navigator.push( MaterialPageRoute(builder: (context)=>regester_shopapp()),
                          },
                                    child:Text('Register',style: TextStyle(
                                        fontSize: 15,fontWeight: FontWeight.bold),),)
                      ],)
                  ],),
              ),
            ),
          ),
        ),
      ),
    );
        }
        )
    );
  }
}
