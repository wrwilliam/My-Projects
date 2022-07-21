///
/// Has not been finished.
/// Retrieve the information directly by using garage.title, garage.description and garage.imageUrl
///

import 'package:flutter/material.dart';
import 'package:hyper_garage_sale/Garage.dart';

class GarageInfoPage extends StatefulWidget {
  const GarageInfoPage({Key? key, required this.garage}) : super(key: key);

  final Garage garage;

  @override
  State<StatefulWidget> createState() => _GarageInfoPageState(garage);

}

class _GarageInfoPageState extends State<GarageInfoPage> {
  _GarageInfoPageState(this.garage);

  Garage garage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF398BEF),
          automaticallyImplyLeading: true,
          title: Text(
            ('${garage.title}\'s Info'),
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          elevation: 2,
        ),
        body:
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  'Garage Title:',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Text(
              garage.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            const Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  'Garage Price:',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Text(
              garage.price.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            const Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  'Garage Description:',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Text(
              garage.description,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  padding: const EdgeInsets.all(10),
                  childAspectRatio: 0.8,
                  children: formGrids(),
                )
            )
          ],
        )
    );
  }

  List<Widget> formGrids() {
    List<Widget> widgets = <Widget>[];
    for (String imageUrl in garage.imageUrls) {
      InkWell inkWell = InkWell(
        child: Hero(
            tag: imageUrl,
            child: Image.network(imageUrl),
        ),
        onTap: () => _goToBigImagePage(context, imageUrl),
      );
      widgets.add(inkWell);
    }
    return widgets;
  }

  void _goToBigImagePage(BuildContext context, String imageUrl) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Image of ${garage.title}",
          ),
        ),
        body: Center(
          child: Hero(
            tag: imageUrl,
            child: Image.network(imageUrl),
          ),
        ),
      )
    ));
  }
}