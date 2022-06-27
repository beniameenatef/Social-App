
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/model/cupitfirebase.dart';
import 'package:socialapp/model/statesfirebase.dart';
import 'package:socialapp/module/login.dart';


class regestersocialapp extends StatelessWidget {
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var namecontroller=TextEditingController();
  var phonecontroller=TextEditingController();
  var uidcontroller=TextEditingController();

  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>socialappcupitOne(),
      child: BlocConsumer< socialappcupitOne,socialappOnestate>(
        listener: (context,state)
        {
          if(state is SocialCreateAccountUserSuccessState)
          {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => loginsocialapp()),
                  (Route<dynamic> route) => false,
            );

            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => homescreen()));
            // Navigator.push(
            // context,
            // MaterialPageRoute(builder: (context) => homescreen()),
            // Navigator.push( MaterialPageRoute(builder: (context)=>regester_shopapp()),
          }

        },
        builder: (context,state){
          var cupit= socialappcupitOne.get(context);
          return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(key: formkey,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Register',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.blue),),
                      SizedBox(height: 10,),
                      Text('Complete this form',style: TextStyle(fontSize: 20,color: Colors.grey),),
                      SizedBox(height: 20,),
                      TextFormField(controller: namecontroller,
                        decoration:InputDecoration(
                          // prefixIcon:Icon(Icons.username),
                          labelText:'User Name' ,
                          border:OutlineInputBorder(),
                        ) ,
                        validator: (value){
                          if (value!.isEmpty)
                            return ('name must not be empty');
                        },),
                      SizedBox(height: 20,),
                      TextFormField(controller: emailcontroller,
                        decoration:InputDecoration(
                          prefixIcon:Icon(Icons.email),
                          labelText:'Email' ,
                          border:OutlineInputBorder(),
                        ) ,
                        validator: (value){
                          if (value!.isEmpty)
                            return ('amail address must not be empty');
                        },),
                      SizedBox(height: 20,),
                      TextFormField(controller: passwordcontroller,
                        decoration:InputDecoration(
                          prefixIcon:Icon(Icons.lock_outline),
                          labelText:'password' ,
                          border:OutlineInputBorder(),
                        ) ,
                        validator: (value){
                          if (value!.isEmpty)
                            return ('password must not be empty');
                        },),
                      SizedBox(height: 20,),
                      TextFormField(controller: phonecontroller,
                        decoration:InputDecoration(
                          prefixIcon:Icon(Icons.phone),
                          labelText:'Phone Number' ,
                          border:OutlineInputBorder(),
                        ) ,
                        validator: (value){
                          if (value!.isEmpty)
                            return ('phone must not be empty');
                        },),
                      SizedBox(height: 20,),
                      ConditionalBuilder(
                        condition: state is! SocialRegisterLoadingState,
                        builder: (context) => MaterialButton(onPressed: ()
          {
          if(formkey.currentState!.validate())
          {
            cupit.register(
              name: namecontroller.text.trim(),
              phone: phonecontroller.text.trim(),
              email: emailcontroller.text.trim(),
              password: passwordcontroller.text.trim(),
              uid:uidcontroller.text.trim());


          }
          },
          child: Text('REGISTER',),color: Colors.blue,),
                        fallback: (BuildContext context)=> Center(
              child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
         );
        }
      ),
    );
  }

}
