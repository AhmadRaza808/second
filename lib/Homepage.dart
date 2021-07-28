import 'package:flutter/material.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:online_shop/horizantallist.dart';
import 'package:online_shop/pages/cart.dart';
import 'package:online_shop/products.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //design app bar
      appBar: AppBar(
        title: Text("Shop Store"),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => cart()));
            },
          ),
        ],
      ),
      //navigation or footer bat
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.redAccent,
        selectedFontSize: 15,
        // unselectedFontSize: 5,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: Text("Home"),
            //backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            // ignore: deprecated_member_use
            title: Text("Category"),
            //backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_sharp),
            // ignore: deprecated_member_use
            title: Text("Stores"),
            // backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            // ignore: deprecated_member_use
            title: Text("Cart"),
            // backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            // ignore: deprecated_member_use
            title: Text("Account"),
            // backgroundColor: Colors.redAccent,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
      //design drawer
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Ahmad Raza Ghurki'),
              accountEmail: Text('razaghurki786@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/ahm.png'),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              child: ListTile(
                title: Text("HomePage"),
                leading: Icon(
                  Icons.home,
                  color: Colors.redAccent,
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(
                  Icons.person,
                  color: Colors.redAccent,
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("My Order"),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.redAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => cart()));
              },
              child: ListTile(
                title: Text("Shoping cart"),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.redAccent,
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("Favorites"),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                ),
              ),
            ),
            Divider(),
            InkWell(
              child: ListTile(
                title: Text("Setting"),
                leading: Icon(
                  Icons.settings,
                  color: Colors.redAccent,
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.help,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
      //design slider  or carousel
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Carousel(
              boxFit: BoxFit.cover,
              images: [
                Image.asset('images/ahm.png'),
                Image.asset('images/ghj.png'),
                Image.asset('images/asd.jpg'),
              ],
              autoplay: true,
              animationCurve: Curves.fastOutSlowIn,
              dotSize: 2.0,
              //dotColor: Colors.redAccent,
              indicatorBgPadding: 12.0,
              dotBgColor: Colors.transparent,
              //    animationCurve: Curves.fastOutSlowIn,
              //     animationDuration: Duration(milliseconds: 1000),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Categories'),
          ),
          // call a function of horizantal list
          HorizantalList(),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Recent Products'),
          ),

          Flexible(
            child: products(),
          ),
        ],
      ),
    );
  }
}
