
import 'package:flutter/material.dart';
import 'package:hyper_garage_sale/AuthUtil.dart';
import 'package:hyper_garage_sale/GarageListView.dart';

class GarageListPage extends StatefulWidget {
  const GarageListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GarageListPageState();
}

class _GarageListPageState extends State<GarageListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Garages for Sale"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                signOut();
                Navigator.pushNamed(context, '/loginpage');
              },
              icon: const Icon(Icons.logout)
          )
        ],
      ),
      body: const GarageListView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/newgaragepostpage');
        },

      ),
    );
  }
}