import 'package:cloud_firestore/cloud_firestore.dart';

class VendorModel {
  final String uid;
  final String name;
  final String address;
  final String phone;
  final String observations;

  VendorModel({
    this.uid = '',
    this.name = '',
    this.address = '',
    this.phone = '',
    this.observations = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'address': address,
      'phone': phone,
      'observations': observations,
    };
  }

  factory VendorModel.fromMap(Map<String, dynamic> map, String documentId) {
    return VendorModel(
      uid: documentId,
      name: map['name'],
      address: map['address'],
      phone: map['phone'],
      observations: map['observations'],
    );
  }

  static VendorModel fromSnapshot(DocumentSnapshot snapshot) {
    return VendorModel.fromMap(snapshot.data() as Map<String, dynamic>, snapshot.id);
  }

  VendorModel copyWith({
    String? uid,
    String? name,
    String? address,
    String? phone,
    String? observations,
  }) {
    return VendorModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      observations: observations ?? this.observations,
    );
  }
}
