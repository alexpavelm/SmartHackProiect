import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class City {

  final String name;
  final String country;
  final int aqi;
  final bool isPredicted;
  final double lat;
  final double long;
  final String provider;
  final DocumentReference reference;

  // Data taken from database about cities
  City.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['country'] != null),
        assert(map['aqi'] != null),
        assert(map['isPredicted'] != null),
        assert(map['lat'] != null),
        assert(map['long'] != null),
        assert(map['provider'] != null),
        name = map['name'],
        country = map['country'],
        aqi = map['aqi'],
        isPredicted = map['isPredicted'],
        lat = map['lat'],
        long = map['long'],
        provider = map['provider'];

  City.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

}