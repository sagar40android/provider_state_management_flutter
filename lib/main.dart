import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstatemanagementflutter/MyCounterApp.dart';

import 'Data.dart';



// void main() => runApp(MyApp());
void main() => runApp(MyCounterApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<Counter>.value(value: Counter())
      ],
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final DataClassListner= Provider.of<Counter>(context,listen: false);

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar:AppBar(
          title: Text("provider state"),
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(Provider.of<Counter>(context,listen: true).counter.toString()),
              RaisedButton(onPressed: (){
                Provider.of<Counter>(context,listen: false).incrementCount();
              }
              ,child: Text("+"),),
              RaisedButton(onPressed: (){
                Provider.of<Counter>(context,listen: false).decrement();
              }
                ,child: Text("-"),)
            ],
          ),
        )
      ),
    );
  }
}



