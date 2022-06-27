
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/screens/Cupit/cupitTwo.dart';
import 'package:socialapp/screens/Cupit/stateTwo.dart';
import 'package:socialapp/screens/style/icon_broken.dart';



class socialApp extends StatefulWidget {
  @override
  _socialAppState createState() => _socialAppState();
}

class _socialAppState extends State<socialApp> {

  List<String>namescrean=
  [
    "home",
    "chat",
    'add post',
    "users",
    "setting",
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>socialappcupitTwo(),
      child: BlocConsumer< socialappcupitTwo , socialappTwostate>(
          listener:(context,state)
          {
          },
          builder: (context,state){
            var cupit =socialappcupitTwo.get(context);
              //..getchat()..getusers()..getsetting();
            return Scaffold(
              body:cupit.screen[cupit.currentindex] ,
              bottomNavigationBar: BottomNavigationBar(
                 selectedItemColor: Colors.blue  ,
                elevation: 10,
               // selectedLabelStyle: TextStyle(color: Colors.blue),
                unselectedIconTheme: IconThemeData(color: Colors.black, ),
                currentIndex: cupit.currentindex,
                onTap: (index)
                {
                  cupit.changepages(index,context);
                },
                items: cupit.bottomnavigationitem,
              ),
              appBar: AppBar(
                title: Text(namescrean[cupit.currentindex],
                ),
                actions: [
                  IconButton(
                    icon: Icon(IconBroken.Search),
                    onPressed: () {},
                  ),

                  IconButton(onPressed: ()
                  {
                  },icon:Icon( IconBroken.Notification,))], ),
            );
          }
      ),
    );
  }
}
