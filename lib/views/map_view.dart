import 'package:flutter/material.dart';

import '../widgets/primary_loading_button.dart';
import 'order_view.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("MAP IS LOADING..."),
            const SizedBox(height: 100,),
            PrimaryLoadingButton(buttonName: "Complete Delivery",onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderView()));
            },),
          ],
        ),
      ),
    );
  }
}
