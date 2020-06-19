import 'package:flutter/material.dart';
import 'package:shop/pages/cart.page.dart';
import 'package:shop/pages/home.page.dart';
import 'package:shop/pages/login.page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          HomePage(),
          CartPage(),
          LoginPage(),
        ],
      ),
      bottomNavigationBar: new TabBar(
        tabs: [
          Tab(
            icon: new Icon(Icons.home),
            // text: "Home",
          ),
          Tab(
            icon: new Icon(Icons.shopping_cart),
            // text: "Cart",
          ),
          Tab(
            icon: new Icon(Icons.perm_identity),
            // text: "Login",
          ),
        ],
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
