import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Data/Materie.dart';

class GlobalData {

  static final GlobalData _singleton = GlobalData._internal();

  factory GlobalData() {
    return _singleton;
  }

  GlobalData._internal();

  int currentChapter = 1;
  List<DocumentSnapshot> matrici;
  List<DocumentSnapshot> questions;
  List<String> capitole = [
    "Diagonalizarea matricei",
    "Operatii cu matrice",
    "Inmultirea matricei",
    "Diagonala",
    "Ceva"
  ];
  final formKey = GlobalKey<FormState>();

  GoogleSignInAccount currentUser;


  List<Materie> materii = [
    Materie("Matematică", Icon(Icons.category)),
    Materie("Fizică", Icon(Icons.phone_android)),
    Materie("Chimie", Icon(Icons.border_top)),
  ];

  List<Materie> subscribed = [
  ];

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String getChapterData(int chapter) {
    var globalData = GlobalData();
    return globalData.matrici.firstWhere((el) => el.data["id"] == globalData.currentChapter).data["text"];
  }

  Color getCardColor(int quality) {
    if (quality < 51) {
      return Colors.green.shade500;
    } else if (quality < 101) {
      return Colors.yellow.shade500;
    } else if (quality < 151) {
      return Colors.orange.shade600;
    } else if (quality < 201) {
      return Colors.red.shade400;
    } else {
      return Colors.purple.shade400;
    }
  }

  Color getCardDarkColor(int quality) {
    if (quality < 51) {
      return Colors.green.shade700;
    } else if (quality < 101) {
      return Colors.yellow.shade700;
    } else if (quality < 151) {
      return Colors.orange.shade800;
    } else if (quality < 201) {
      return Colors.red.shade600;
    } else {
      return Colors.purple.shade600;
    }
  }
}
