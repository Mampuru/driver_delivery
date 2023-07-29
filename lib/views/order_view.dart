import 'package:flutter/material.dart';

import 'map_view.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Request"),),
      body: Column(
        children: [
            const SizedBox(height: 10,),
            Card(
              child: ListTile(
                leading: const Icon(Icons.shopping_basket),
                title: const Text("Order value: R150.06"),
                subtitle: const Text("Store: KFC"),
                trailing: const Text("Location: Ferndale"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MapView()));
                },
              ),
            ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: const Text("Order value: R178.50"),
              subtitle: const Text("Store: RocoMama"),
              trailing: const Text("Location: Ferndale"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MapView()));
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: const Text("Order value: R54.20"),
              subtitle: const Text("Store: McDonald"),
              trailing: const Text("Location: Ferndale"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MapView()));
              },
            ),
          )
        ],
      ),
    );
  }
}
