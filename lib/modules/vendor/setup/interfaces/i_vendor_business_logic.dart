import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/vendor_model.dart';
export '../model/vendor_model.dart';

abstract class IVendorBusinessLogic {
  Future<VendorModel?> get(String id);
  Future<void> create(VendorModel vendor);
  Future<void> update(VendorModel vendor);
  Future<void> delete(VendorModel vendor);
  StreamSubscription<List<VendorModel>>? initStream({
    required RxList<VendorModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<VendorModel>)? onNewData,
  });
}
