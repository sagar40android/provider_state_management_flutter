import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstatemanagementflutter/Album.dart';
import 'package:providerstatemanagementflutter/CartModel.dart';
import 'package:providerstatemanagementflutter/Data.dart';
import 'package:providerstatemanagementflutter/MyCart.dart';
import 'package:providerstatemanagementflutter/Services.dart';

import 'AarthmeticCalculationModel.dart';



class MyCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<Counter>.value(value: Counter()),
        ChangeNotifierProvider<AarthmeticCalculationModel>.value(value: AarthmeticCalculationModel()),
      ChangeNotifierProvider<CartModel>.value(value: CartModel())],
      child: MaterialApp(
        theme: ThemeData(
          primaryColorDark: Colors.amberAccent,
        ),
        home: MyCounterHomeApp(),
      ),
    );
  }
}

class MyCounterHomeApp extends StatefulWidget {


  @override
  _MyCounterHomeAppState createState() => _MyCounterHomeAppState();
}

class _MyCounterHomeAppState extends State<MyCounterHomeApp> {
  List<String> myList= [
    "A0",
    "B1",
    "C2",
    "D3",
    "E4",
    "F5",
    "G6",
    "H7",
    "I8",
    "J9",
    "K10"
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("ddddd"),
        actions: [
          Stack(
            children: [
              Icon(Icons.add_shopping_cart),
              Padding(
                padding: EdgeInsets.only(right: 10,top: 10),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyCart()));

                  },
                  child: CircleAvatar(
                    // child: Text("${Provider.of<Counter>(context,listen: true).counter.toString()}",style: TextStyle(color: Colors.white),),
                    child: Text("${Provider.of<CartModel>(context,listen: true).itemListLength}",
                      style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.red,
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text("Items  =>  ${Provider.of<Counter>(context,listen: true).counter.toString()}")
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
            color: Colors.greenAccent,
              icon: Icon(Icons.add_shopping_cart),
              onPressed: (){
                  Provider.of<Counter>(context,listen: false).incrementCount();
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: IconButton(
            color: Colors.greenAccent,
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: (){
                Provider.of<Counter>(context,listen: false).decrement();
              },
            ),
          ),

          // Align(
          //   alignment: Alignment.center,
          //   child: Text("${Provider.of<AarthmeticCalculationModel>(context,listen: true).number}"),
          // ),
          //
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: IconButton(
          //     color: Colors.greenAccent,
          //     icon: Icon(Icons.add),
          //     onPressed: (){
          //       Provider.of<AarthmeticCalculationModel>(context,listen: false).incrementCount();
          //     },
          //   ),
          // ),
          //
          //
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: IconButton(
          //     color: Colors.greenAccent,
          //     icon: Icon(Icons.remove),
          //     onPressed: (){
          //       Provider.of<AarthmeticCalculationModel>(context,listen: false).decrement();
          //     },
          //   ),
          // ),

          Align(
            alignment: Alignment.center,
            child: Container(
              height: 400,
              width: 400,
              child: ListView.separated(
                itemCount:  myList != null ? myList.length : 0,
                  itemBuilder: (context,index){

                    return ListTile(
                      title: Text(myList[index].toString()),
                      trailing: AnimatedCrossFade(
                          firstChild: addIntoCartView(context,myList[index].toString()),
                          secondChild: addedCartView(),
                          crossFadeState: Provider.of<CartModel>(context,listen: false).allItem.contains(myList[index]) ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                          duration: Duration(seconds: 1)),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                  return Divider(height: 2,color: Colors.black,);
              },),
            ),
          )
        ],
      ),

    );
  }
  
  Widget addIntoCartView(BuildContext context,String name){
    return IconButton(icon: Icon(Icons.add), onPressed: (){
  Provider.of<CartModel>(context,listen: false).add(name.toString());
  });
}
  Widget addedCartView(){
    return Icon(Icons.check,color: Colors.green,);
  }
}


