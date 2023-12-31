import 'package:ecommerce/providers/providers.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalAmount() {
    double total = 0;
    for (var items in Provider.of<CartProvider>(context).cartList) {
      total += items.quantity * items.product.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: secondaryColor,
        appBar: AppBar(
          title: const Text("Shopping Cart"),
        ),
        body: value.cartList.isEmpty
            ? const Center(
                child: Text(
                  "No items carted yet.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.cartList.length,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Dismissible(
                              background: Container(
                                color: Colors.red,
                                child: const Icon(Icons.delete),
                              ),
                              key: Key(value.cartList[index].id.toString()),
                              onDismissed: (DismissDirection direction) {
                                setState(() {
                                  value.cartList.removeWhere((item) =>
                                      item.id == value.cartList[index].id);
                                  value.totalquantity = 0;
                                  for (var items in value.cartList) {
                                    value.totalquantity += items.quantity;
                                  }
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      "1 item removed from Cart",
                                    ),
                                    duration: Duration(
                                      milliseconds: 250,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.white,
                                    child: Image.network(
                                      value.cartList[index].product.image,
                                      height: 40,
                                    ),
                                  ),
                                  title: Text(
                                    value.cartList[index].product.title,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Quantity: ${value.cartList[index].quantity.toString()}",
                                    style: const TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  trailing: Text(
                                    "\$ ${value.cartList[index].product.price}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: greenColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              height: 0,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: mainColor,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        ListTile(
                          tileColor: secondaryColor,
                          leading:
                              const Icon(Icons.account_balance_wallet_outlined),
                          title: const Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(
                            "\$ ${totalAmount().toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: greenColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 16,
                          ),
                          child: SizedBox(
                            height: 48,
                            width: double.maxFinite,
                            child: Builder(builder: (context) {
                              return TextButton(
                                style: TextButton.styleFrom(
                                  elevation: 8,
                                  backgroundColor: greenColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text(
                                        "Purchase Sucessful",
                                      ),
                                      duration: Duration(
                                        milliseconds: 250,
                                      ),
                                    ),
                                  );
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Close'),
                                              ),
                                            ],
                                            title: const Text(
                                                "Hurray! Items purchased Sucessfully"),
                                          ));
                                },
                                child: const Text(
                                  "Purchase Now",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: secondaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
