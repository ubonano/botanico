import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class ViaShipmentService extends GetxService with GlobalHelper implements IViaShipmentService {
  late final IViaShipmentBusinessLogic _viaShipmentBusinessLogic = Get.find();

  @override
  Future<ViaShipmentModel?> get(String id) async => await operation.perform(
        operationName: 'Get shipment $id',
        permissionKey: ViaShipmentModulePermissions.viewKey,
        operation: (_) async => await _viaShipmentBusinessLogic.get(id),
      );

  @override
  Future<ViaShipmentModel?> getFromExternalAPI(String id) async => await operation.perform(
        operationName: 'Get shipment from External API $id',
        errorMessage: 'Error al obtener el envío $id',
        operation: (_) async => _viaShipmentBusinessLogic.getFromExternalAPI(id),
      );

  @override
  Future<void> create(ViaShipmentModel shipment) async => await operation.perform(
        operationName: 'Create via shipment ${shipment.shipmentId}',
        permissionKey: ViaShipmentModulePermissions.createKey,
        operation: (_) async => await _viaShipmentBusinessLogic.create(shipment),
      );

  @override
  Future<void> update(ViaShipmentModel shipment) async => await operation.perform(
        operationName: 'Update via shipment ${shipment.shipmentId}',
        permissionKey: ViaShipmentModulePermissions.updateKey,
        operation: (_) async => await _viaShipmentBusinessLogic.update(shipment),
      );

  @override
  Future<void> delete(ViaShipmentModel shipment) async => await operation.perform(
        operationName: 'Delete via shipment ${shipment.shipmentId}',
        permissionKey: ViaShipmentModulePermissions.deleteKey,
        operation: (_) async => await _viaShipmentBusinessLogic.delete(shipment),
      );

  @override
  Future<void> invoice(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModulePermissions.invoiceKey,
        operationName: 'Invoice shipment ${shipment.shipmentId}',
        operation: (_) async => await _viaShipmentBusinessLogic.invoice(shipment),
      );

  @override
  Future<void> cancelInvoice(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModulePermissions.cancelInvoiceKey,
        operationName: 'Cancel invoice shipment ${shipment.shipmentId}',
        operation: (_) async => await _viaShipmentBusinessLogic.cancelInvoice(shipment),
      );

  @override
  Future<void> archive(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModulePermissions.archiveKey,
        operationName: 'Archive shipment ${shipment.shipmentId}}',
        operation: (_) async => await _viaShipmentBusinessLogic.archive(shipment),
      );

  @override
  Future<void> deliver(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModulePermissions.deliverKey,
        operationName: 'Deliver shipment ${shipment.shipmentId}}',
        operation: (_) async => await _viaShipmentBusinessLogic.deliver(shipment),
      );

  @override
  Future<void> prepare(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModulePermissions.prepareKey,
        operationName: 'Prepare shipment ${shipment.shipmentId}}',
        operation: (_) async => await _viaShipmentBusinessLogic.prepare(shipment),
      );

  @override
  Future<void> process(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModulePermissions.processKey,
        operationName: 'Process shipment ${shipment.shipmentId}}',
        operation: (_) async => await _viaShipmentBusinessLogic.process(shipment),
      );

  @override
  Future<void> changeDeliveryPlace(ViaShipmentModel shipment, ViaShipmentDeliveryPlace newPlace) async =>
      await operation.perform(
        permissionKey: ViaShipmentModulePermissions.changeDeliveryPlaceKey,
        operationName: 'Change delivery place ${shipment.shipmentId}',
        operation: (_) async => await _viaShipmentBusinessLogic.changeDeliveryPlace(shipment, newPlace),
      );

  @override
  StreamSubscription<List<ViaShipmentModel>>? initializeStream({
    required RxList<ViaShipmentModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
    Function(List<ViaShipmentModel>)? onNewData,
  }) =>
      _viaShipmentBusinessLogic.initStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        states: states,
        onNewData: onNewData,
      );
}
