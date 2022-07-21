
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:math';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class Garage {
  Garage({required this.title, required this.price, required this.description, required this.imageFilePaths, this.documentId});
  Garage.fullConstructor({required this.title, required this.price, required this.description,required this.imageUrls, required this.imageFilePaths});
  Garage.withId({required this.title, required this.price, required this.description,required this.documentId, required this.imageFilePaths});

  static Future<String> getImageUrl(String imageFilePath) {
    final garageImageRef = FirebaseStorage.instanceFor(bucket: "gs://hyper-garage-sale-zach.appspot.com/").ref();
    return garageImageRef.child(imageFilePath.toString()).getDownloadURL();
  }
  static CollectionReference<Garage> garageRef = FirebaseFirestore.instance.collection('garages').withConverter<Garage>(
    fromFirestore: (snapshot, _) => Garage.fromJson(snapshot.data()!),
    toFirestore: (garage, _) => garage.toJson(),
  );

  Garage.fromJson(Map<String, Object?> json)
  : this (
    title: json['title']! as String,
    price: json['price']! as double,
    description: json['description']! as String,
    imageFilePaths: json['imageFilePaths'] as List<dynamic>,
  );

  Garage.fromJsonWithId(Map<String, Object?> json, String id)
  // : Garage.withId(
  : this (
      title: json['title']! as String,
      price: json['price']! as double,
      description: json['description']! as String,
      documentId: id,
      imageFilePaths: json['imageFilePaths'] as List<dynamic>,
  );

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'price': price,
      'description': description,
      'imageUrls': imageUrls,
      'imageFilePaths': imageFilePaths,
    };
  }

  Future<List<String>> getImageUrls() async {
    List<String> imageUrls = <String>[];
    final garageImageRef = FirebaseStorage.instanceFor(bucket: "gs://hyper-garage-sale-zach.appspot.com/").ref();
    for (dynamic imageFilePath in imageFilePaths) {
      imageUrls.add(await garageImageRef.child(imageFilePath.toString()).getDownloadURL());
    }
    return imageUrls;
  }

  final String title, description;
  late String? documentId;
  final List<dynamic> imageFilePaths;
  late List<String> imageUrls = <String>[];
  final double price;
}

class GarageCollection {
  static List<Garage> garageCollection = <Garage>[];

  static Future<void> updateData() async {
    // init();
    // for (Garage garage in garageCollection) {
    //   print("garage`s title:" + garage.title);
    //   garage.imageUrls = await garage.getImageUrls();
    // }
  }

  static List<Garage> init() {
    FirebaseFirestore.instance
        .collection('garages')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // print(doc["first_name"]);
        String docId = doc.id;
        garageCollection.add(Garage.fromJsonWithId(doc.data()! as Map<String, dynamic>, docId));
      });
    });
    return garageCollection;
  }

  static List<Garage> getInstance() {
    return garageCollection;
  }
}

// md5 hashing a random number
String md5RandomString() {
  final randomNumber = Random().nextDouble();
  final randomBytes = utf8.encode(randomNumber.toString());
  final randomString = md5.convert(randomBytes).toString();
  return randomString;
}

Future<List<String>> uploadGarageImage(File file) async {
  final garagesRef = FirebaseStorage.instanceFor(bucket: "gs://hyper-garage-sale-zach.appspot.com/").ref().child("garages");
  String fullPath = file.path;
  String imageUrl, imageFilePath;
  int index = fullPath.lastIndexOf(".");
  String randomId = md5.convert(utf8.encode(file.toString())).toString();
  String suffix = fullPath.substring(index, fullPath.length);
  String fullImagePath = "$randomId$suffix";
  final curGarageRef = garagesRef.child(fullImagePath);
  try {
    print("No need to upload!");
    imageUrl = await curGarageRef.getDownloadURL();
    imageFilePath = curGarageRef.fullPath;
  } on Exception catch (e) {
    print("Begin upload!");
    UploadTask uploadTask = curGarageRef.putFile(file);
    // uploadTask.whenComplete(() {
    //   print("Upload complete.");
    // });
    // TaskSnapshot uploadTask = await curGarageRef.putFile(file);
    // imageFilePath = uploadTask.ref.fullPath;
    while (true) {
      try {
        imageUrl = await curGarageRef.getDownloadURL();
        break;
      } on Exception catch (e) {
        print("not finished");
      }
    }
    imageFilePath = curGarageRef.fullPath;
  }
  print("fullPath:$imageFilePath");
  List<String> res = <String>[imageUrl, imageFilePath];
  return res;
}

Future<Garage?> createGarageRecord(String title, String priceString, String description, List<String> imageLocalPaths, BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Uploading"),
        );
      }
  );
  List<String> imageFilePaths = <String>[];
  List<String> imageUrls = <String>[];
  for (String imageLocalPath in imageLocalPaths) {
    print("ImageLocalPath:$imageLocalPath");
    File imageFile = File(imageLocalPath);
    List<String> paths = await uploadGarageImage(imageFile);
    imageUrls.add(paths.elementAt(0));
    imageFilePaths.add(paths[1]);
  }
  double? price = double.tryParse(priceString);
  if (price == null) {
    print("No price");
    return null;
  }
  Garage garage = Garage.fullConstructor(title: title, price: price, description: description,imageUrls: imageUrls, imageFilePaths: imageFilePaths);
  print("Form Garage");
  Garage.garageRef.add(garage);
  print("updated Garage");
  Navigator.pop(context);
  return garage;
}