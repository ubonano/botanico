import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../vendor_model.dart';

abstract class IVendorBusinessLogic {
  Future<VendorModel?> get(String id);
  Future<void> create(VendorModel vendor);
  Future<void> update(VendorModel vendor);
  Future<void> delete(String id);
  Future<void> postCreate();
  Future<void> postUpdate();
  StreamSubscription<List<VendorModel>> initializeStream({
    required RxList<VendorModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<VendorModel>)? onNewData,
  });
}
