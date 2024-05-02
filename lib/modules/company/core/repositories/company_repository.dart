import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../company_module.dart';

class CompanyRepository implements ICompanyRepository {
  final FirebaseFirestore _firestore = Get.find();

  @override
  String get generateId => _companyRef.doc().id;

  @override
  Future<CompanyModel?> get(String id) async {
    final docSnapshot = await _companyRef.doc(id).get();
    return docSnapshot.exists ? CompanyModel.fromSnapshot(docSnapshot) : null;
  }

  @override
  Future<void> create(CompanyModel company, {Transaction? txn}) async {
    DocumentReference docRef = _companyRef.doc(company.uid);
    txn != null ? txn.set(docRef, company.toMap()) : await docRef.set(company.toMap());
  }

  CollectionReference<Map<String, dynamic>> get _companyRef => _firestore.collection(FirestoreCollections.companies);
}
