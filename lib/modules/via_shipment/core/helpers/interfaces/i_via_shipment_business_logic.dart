import 'package:get/get.dart';

import '../../via_shipment_model.dart';

abstract class IViaShipmentBusinessLogic {
  RxList<ViaShipmentModel> get viaShipmentList$;

  Future<ViaShipmentModel?> get(String id);
  Future<void> createViaShipment(ViaShipmentModel viaShipment);
  Future<void> updateViaShipment(ViaShipmentModel viaShipment);
  Future<void> deleteViaShipment(String id);
  Future<void> postCreateViaShipment();
  Future<void> postUpdateViaShipment();
  Future<void> initializeViaShipmentStream();
  void cancelViaShipmentStream();
}
