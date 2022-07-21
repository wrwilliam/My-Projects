
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hyper_garage_sale/GarageInfoPage.dart';

import 'Garage.dart';

class GarageListView extends StatefulWidget {
  const GarageListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GarageListViewState();
}

class _GarageListViewState extends State<GarageListView> {
  final Stream<QuerySnapshot> _garageStream = FirebaseFirestore.instance.collection('garages').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _garageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text(
            "Something went wrong!",
            style: TextStyle(
                color: Color(0xFF398BEF)
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text(
            "Loading...",
            style: TextStyle(
                color: Color(0xFF398BEF)
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Text(
              "No Items!",
            style: TextStyle(
              color: Color(0xFF398BEF)
            ),
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            Garage garage = Garage.fromJson(data);
            return ListTile(
              leading: (garage.imageUrls == null && garage.imageUrls.isNotEmpty)
                  ? Image.network(garage.imageUrls.elementAt(0))
                  : const Icon(Icons.image),
              title: Text(garage.title),
              // title: Text(document.id),
              subtitle: Text(garage.price.toString()),
              onTap: () async {
                Garage garage = await Garage.garageRef.doc(document.id).get().then((snapshot) => snapshot.data()!);
                garage.imageUrls = await garage.getImageUrls();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GarageInfoPage(garage: garage,)
                  )
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}