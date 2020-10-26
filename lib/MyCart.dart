import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstatemanagementflutter/CartModel.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<String> cartList;
  @override
  void initState() {
    super.initState();
    cartList = Provider.of<CartModel>(context,listen: false).allItem;
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider<CartModel>.value(value: CartModel())],
    child: Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: ListView.builder(
          itemCount:  cartList != null ? cartList.length : 0,
          itemBuilder: (context,index){

            return ListTile(
              title: Text(cartList[index].toString()),
              // trailing: IconButton(icon: Icon(Icons.add), onPressed: (){
              //   Provider.of<CartModel>(context,listen: false).add(cartList[index].toString());
              // }),
            );
          }),
    ),);
  }
}
