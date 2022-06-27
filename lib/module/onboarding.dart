
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:socialapp/classes/onboaring%20class.dart';
import 'package:socialapp/module/login.dart';

class onBoardingScrean extends StatelessWidget {
  List <onBoarding> boarding=
  [
    onBoarding(
        image: 'assets/images/bena.jpg',
        text: 'text1',
        body: "body1"),
    onBoarding(
        image: 'assets/images/bena.jpg',
        text: "text2",
        body: "body2"),
    onBoarding(
        image: 'assets/images/bena.jpg',
        text: 'text3',
        body: "body3"),
  ];
  var boardcontroller=PageController();
  bool islast=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello=>'),
        actions: [TextButton(onPressed: ()
        {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => loginsocialapp()));
        }, child: Padding(
          padding: const EdgeInsetsDirectional.only(end: 20),
          child: Text('Skip',style: TextStyle(fontSize: 20,color: Colors.black),),
        ),)],

      ),
      body:Column(
        children: [

          Expanded(
            child: PageView.builder(itemBuilder: (context,index)
            =>buildBoardingItem(boarding[index]),
              itemCount: boarding.length,
              controller:boardcontroller,
              physics: BouncingScrollPhysics(),
              onPageChanged: (int index)
              {
                if (index == boarding.length-1)
                {
                    islast=true;
                }
                else
                  {
                 islast=false;
                  }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [

                SmoothPageIndicator(controller: boardcontroller, count: boarding.length,
                  effect:ExpandingDotsEffect(
                    dotColor:Colors.grey ,
                    dotHeight:10 ,
                    dotWidth:10 ,
                    expansionFactor: 4,
                    activeDotColor: Colors.indigo,
                    spacing: 5,

                  ) ,),
                Spacer(),

                FloatingActionButton(
                  onPressed: (){
                    boardcontroller.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                    if(islast)
                    {
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => loginsocialapp()),
                      );
                    }
                  },
                  child:Icon(Icons.arrow_forward_ios_outlined),
                ),
              ],
            ),
          ),
        ],
      ) ,
    );

  }
  // void navigateandfinish(context,widget)=>Navigator.pushAndRemoveUntil(context,
  //     MaterialPageRoute(builder: (context) => loginsocialapp()),
  //         (Route<dynamic>route) => false);

  Widget buildBoardingItem(onBoarding model)=>  Column(children: [
    Expanded(child: Image(image: AssetImage('${model.image}'),width:100,height: 100,)),
    Text('${model.text}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35)),

    Text('${model.body}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))
  ],);
}
