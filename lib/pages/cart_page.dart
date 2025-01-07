import 'package:flutter/material.dart';
import 'package:grocery_store_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My cart')),
        body: Consumer<CartModel>(builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: value.cartItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Image.asset(
                          value.cartItems[index][2],
                          height: 36,
                        ),
                        title: Text(value.cartItems[index][0]),
                        subtitle: Text('\$' + value.cartItems[index][1]),
                        trailing: IconButton(
                          onPressed: () =>
                              Provider.of<CartModel>(context, listen: false)
                                  .removeItemFromCart(index),
                          icon: Icon(Icons.cancel),
                        ),
                      ),
                    ),
                  );
                },
              )),

              //total price + pay now
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total price',
                              style: TextStyle(color: Colors.green[100]),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$${value.calculateTotalPrice()}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Text(
                              'Pay now',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }));
  }
}
