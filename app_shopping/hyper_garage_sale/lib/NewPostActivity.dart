///
/// use await Garage.garageRef.add(
///                             Garage(
///                               title: "",
///                               description: "",
///                               price: 00,
///                               imageUrl: ""
///                           ),
///                         );
///  to add a garage to the firestore.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:hyper_garage_sale/Garage.dart';
import 'package:image_picker/image_picker.dart';

class NewGaragePostPage extends StatefulWidget {
  const NewGaragePostPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewGaragePostPageState();

}

class _NewGaragePostPageState extends State<NewGaragePostPage> {
  late TextEditingController garageTitleTextFieldController;
  late TextEditingController garagePriceTextFieldController;
  late TextEditingController garageDescriptionTextFieldController;
  List<String> imageLocalPaths = <String>[];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    garageTitleTextFieldController = TextEditingController();
    garagePriceTextFieldController = TextEditingController();
    garageDescriptionTextFieldController = TextEditingController();
  }

  File _imageFile = File("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF398BEF),
        automaticallyImplyLeading: true,
        title: const Text(
          'New Garage Post',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.save,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              if (garageTitleTextFieldController.text.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text("Please input a garage title!"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("OK"),
                        )
                      ],
                    );
                  }
                );
                return;
              }
              double? price = double.tryParse(garagePriceTextFieldController.text);
              if (price == null) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text("Please input a valid price!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"),
                          )
                        ],
                      );
                    }
                );
                return;
              }
              Garage? garage = await createGarageRecord(
                  garageTitleTextFieldController.text,
                  garagePriceTextFieldController.text,
                  garageDescriptionTextFieldController.text,
                  imageLocalPaths,
                context
              );
              if (garage == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Post new garage failed, try again!'))
                );
                return;
              } else {
                await GarageCollection.updateData();
                Navigator.pushNamedAndRemoveUntil(context, '/garagelistpage', (route) => false);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("New Garage Posted Successful!"))
                );
              }
            },
          ),
        ],
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
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: garageTitleTextFieldController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: '[Enter Garage Title here...]',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'Garage Price:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: garagePriceTextFieldController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: '[Enter Garage Price here...]',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'Garage Description:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: garageDescriptionTextFieldController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: '[Enter Garage Description here...]',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.photo_camera,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () async {
                        if (imageLocalPaths.length >= 4) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Too many image!'))
                          );
                          return;
                        }
                        XFile? pickedImage;
                        try {
                          pickedImage = await ImagePicker().pickImage(
                              source: ImageSource.camera);
                        } on PlatformException catch (e) {
                          print(e.message);
                          print(e.code);
                          if (e.code == "no_available_camera") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('No available camera! Try use gallery!'))
                            );
                            return;
                          }
                        }
                        if (pickedImage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('File error, please choose another image!'))
                          );
                          return;
                        }
                        setState(() {
                          _imageFile = File(pickedImage!.path);
                          imageLocalPaths.add(pickedImage.path);
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.photo_album,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () async {
                        if (imageLocalPaths.length >= 4) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Too many image!'))
                          );
                          return;
                        }
                        List<XFile>? pickedImages;
                        await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Choose at most 4 images!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("OK")
                                  )
                                ],
                              );
                            }
                        );
                        pickedImages = await ImagePicker().pickMultiImage();
                        if (pickedImages == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('File error, please choose images again!'))
                          );
                          return;
                        }
                        setState(() {
                          // _imageFile = File(pickedImage.path);
                          for (XFile pickedImage in pickedImages!) {
                            if (pickedImage == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('File error, please choose another image!'))
                              );
                              return;
                            } else {
                              if (imageLocalPaths.length >= 4) {
                                return;
                              }
                              imageLocalPaths.add(pickedImage.path);
                            }
                          }
                        });
                      },
                    ),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                //   child: Row(
                //     children: [
                // Expanded(
                //   child:
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 200
                    ),
                    child: (imageLocalPaths.isNotEmpty)? ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: imageLocalPaths.length,
                        itemBuilder: (context, index) {
                          return Image.file(File(imageLocalPaths.elementAt(index)));
                        }
                    ) : const Icon(Icons.image),
                  )
                // )
              ],
            )
    );
  }
}