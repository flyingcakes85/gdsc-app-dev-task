import 'package:flutter/material.dart';
import 'package:login/show_snackbar.dart';
import 'package:intl/intl.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool addingItem = false;
  var itemList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Center(child: Text(addingItem ? "Add an item" : "Your Items")),
        automaticallyImplyLeading: false,
      ),
      body: addingItem ? addPage() : itemListPage(),
      floatingActionButton: !addingItem
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  addingItem = true;
                });
              },
              tooltip: 'Add Item',
              child: const Icon(Icons.add),
            )
          : Container(),
    ));
  }

  Widget itemListPage() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.scatter_plot_rounded,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          itemList[index]["name"] ?? "No Title",
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            itemList.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 12),
                    Text(itemList[index]["date"] ?? "No Date"),
                    const SizedBox(width: 12),
                    const Icon(Icons.price_change_sharp),
                    const SizedBox(width: 12),
                    Text(itemList[index]["price"] ?? "No Price")
                  ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget addPage() {
    TextEditingController itemNameController = TextEditingController();
    TextEditingController itemPriceController = TextEditingController();
    return Center(
      child: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Input item details",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: itemNameController,
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter Item Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: itemPriceController,
              maxLines: 1,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter Item Price',
              ),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              child: Row(
                children: [
                  Expanded(child: Container()),
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "ADD ITEM",
                    style: TextStyle(color: Colors.white),
                  ),
                  Expanded(child: Container())
                ],
              ),
              color: Colors.green,
              onPressed: () {
                if (itemNameController.text != "" &&
                    itemPriceController.text != "") {
                  if (double.tryParse(itemPriceController.text) != null) {
                    setState(() {
                      itemList.add({
                        "name": itemNameController.text,
                        "price": itemPriceController.text,
                        "date": DateFormat('dd/MM/yyyy kk:mm:ss')
                            .format(DateTime.now())
                      });
                      addingItem = false;
                    });
                  } else {
                    showSnackbar(
                        context, "Price must be a number", Icons.error);
                  }
                } else {
                  showSnackbar(context, "Fields cannot be empty", Icons.error);
                }
              },
            ),
            MaterialButton(
              child: Row(
                children: [
                  Expanded(child: Container()),
                  const Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "CANCEL",
                    style: TextStyle(color: Colors.white),
                  ),
                  Expanded(child: Container())
                ],
              ),
              color: Colors.green,
              onPressed: () {
                setState(() {
                  addingItem = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
