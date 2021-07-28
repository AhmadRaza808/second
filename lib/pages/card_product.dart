import 'package:flutter/material.dart';

class card_product extends StatefulWidget {
  @override
  _card_productState createState() => _card_productState();
}

class _card_productState extends State<card_product> {
  var product_on_the_cart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 99,
      "size": "M",
      "color": "Black",
      "Quantity": 1,
    },
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "price": 49,
      "size": "7",
      "color": "brown",
      "Quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: product_on_the_cart.length,
      itemBuilder: (context, index) {
        return single_cart_product(
          cart_prod_name: product_on_the_cart[index]["name"],
          cart_prod_picture: product_on_the_cart[index]["picture"],
          cart_prod_price: product_on_the_cart[index]["price"],
          cart_prod_size: product_on_the_cart[index]["size"],
          cart_prod_color: product_on_the_cart[index]["color"],
          cart_prod_qty: product_on_the_cart[index]["quantity"],
        );
      },
    );
  }
}

class single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  single_cart_product({
    required this.cart_prod_name,
    required this.cart_prod_picture,
    required this.cart_prod_price,
    required this.cart_prod_size,
    required this.cart_prod_color,
    required this.cart_prod_qty,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          cart_prod_picture,
          height: 100,
          // width: 100,
        ),
        title: Text(cart_prod_name),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // ===== the section of the size======
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    cart_prod_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                // ===== the section of the color======

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    20.0,
                    8.0,
                    8.0,
                    8.0,
                  ),
                  child: Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    cart_prod_color,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            // ===== the section of the price======
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\$${cart_prod_price}",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
