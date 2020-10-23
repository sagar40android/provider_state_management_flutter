import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Data extends ChangeNotifier{
  int counter=0;
 void incrementCount(){
    counter++;
    notifyListeners();
  }

  void decrement(){
   if (counter >0){
     counter--;
     notifyListeners();
   }

  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<Data>.value(value: Data())
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
    final DataClassListner= Provider.of<Data>(context,listen: false);

    return Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(Provider.of<Data>(context,listen: false).counter.toString()),
            RaisedButton(onPressed: (){
              Provider.of<Data>(context,listen: false).incrementCount();
            }
            ,child: Text("+"),),
            RaisedButton(onPressed: (){
              Provider.of<Data>(context,listen: false).decrement();
            }
              ,child: Text("-"),)
          ],
        ),
      )
    );
  }
}



