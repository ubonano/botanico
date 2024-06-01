import 'package:get/get.dart';

import 'core/controllers/via_shipment_form_controller.dart';
import 'core/controllers/via_shipment_list_controller.dart';
import 'core/controllers/via_shipment_dashboard_controller.dart';
import 'core/controllers/via_shipment_delete_controller.dart';
import 'core/controllers/via_shipment_state_controller.dart';
import 'core/controllers/via_shipment_invoice_controller.dart';
import 'core/controllers/via_shipment_cancel_invoice_controller.dart';
import 'core/controllers/via_shipment_change_delivery_place_controller.dart';

import 'core/via_shipment_business_logic.dart';
import 'core/via_cargo_repository.dart';
import 'core/via_shipment_repository.dart';
import 'core/via_shipment_service.dart';
import 'core/helpers/interfaces/i_via_shipment_business_logic.dart';
import 'core/helpers/interfaces/i_via_cargo_repository.dart';
import 'core/helpers/interfaces/i_via_shipment_repository.dart';
import 'core/helpers/interfaces/i_via_shipment_service.dart';

export 'core/controllers/via_shipment_form_controller.dart';
export 'core/controllers/via_shipment_list_controller.dart';
export 'core/controllers/via_shipment_dashboard_controller.dart';
export 'core/controllers/via_shipment_delete_controller.dart';
export 'core/controllers/via_shipment_state_controller.dart';
export 'core/controllers/via_shipment_invoice_controller.dart';
export 'core/controllers/via_shipment_cancel_invoice_controller.dart';
export 'core/controllers/via_shipment_change_delivery_place_controller.dart';

export 'core/via_shipment_business_logic.dart';

export 'core/helpers/interfaces/i_via_shipment_business_logic.dart';
export 'core/helpers/interfaces/i_via_cargo_repository.dart';
export 'core/helpers/interfaces/i_via_shipment_repository.dart';
export 'core/helpers/interfaces/i_via_shipment_service.dart';

export 'core/helpers/via_shipment_navigation_helper.dart';

export 'core/via_shipment_model.dart';

export 'core/via_cargo_repository.dart';
export 'core/via_shipment_repository.dart';
export 'core/via_shipment_service.dart';
export 'core/via_shipment_permissions.dart';

export 'tests/flows/via_shipment_list_navigate_flow.dart';
export 'tests/flows/via_shipment_create_navigate_flow.dart';
export 'tests/flows/via_shipment_save_flow.dart';
export 'tests/flows/via_shipment_fill_data_flow.dart';

export 'tests/via_shipment_create/via_shipment_empty_fields_test.dart';
export 'tests/via_shipment_create/via_shipment_create_success_test.dart';
export 'tests/via_shipment_list/via_shipment_list_find_by_name_test.dart';
export 'tests/via_shipment_list/via_shipment_list_find_enter_validate_all_fields_test.dart';
export 'tests/via_shipment_update/via_shipment_update_success_test.dart';
export 'tests/via_shipment_delete/via_shipment_delete_test.dart';

export 'ui/widgets/buttons/via_shipment_create_fab.dart';
export 'ui/widgets/buttons/via_shipment_list_page_tile_button.dart';
export 'ui/widgets/buttons/via_shipment_delete_icon_button.dart';
export 'ui/widgets/buttons/via_shipment_list_tile_trailing_icon_buttons.dart';
export 'ui/widgets/buttons/via_shipment_enabled_form_fields.dart';
export 'ui/widgets/buttons/shipment_id_search_button.dart';
export 'ui/widgets/buttons/via_shipment_save_button.dart';
export 'ui/widgets/slidable_buttons/archive_slidable_button.dart';
export 'ui/widgets/slidable_buttons/deliver_slidable_button.dart';
export 'ui/widgets/slidable_buttons/prepare_slidable_button.dart';
export 'ui/widgets/slidable_buttons/process_slidable_button.dart';
export 'ui/widgets/slidable_buttons/delete_slidable_button.dart';
export 'ui/widgets/slidable_buttons/edit_slidable_button.dart';
export 'ui/widgets/slidable_buttons/invoice_slidable_button.dart';
export 'ui/widgets/slidable_buttons/cancel_invoice_slidable_button.dart';
export 'ui/widgets/slidable_buttons/delivery_place_slidable_button.dart';

export 'ui/widgets/fields/state_input_field.dart';
export 'ui/widgets/fields/is_invoiced_input_field.dart';
export 'ui/widgets/fields/created_date_time_input_field.dart';
export 'ui/widgets/fields/delivery_place_input_field.dart';
export 'ui/widgets/fields/shipment_id_input_field.dart';
export 'ui/widgets/fields/type_input_field.dart';
export 'ui/widgets/fields/client_input_field.dart';
export 'ui/widgets/fields/package_input_field.dart';
export 'ui/widgets/fields/weight_input_field.dart';
export 'ui/widgets/fields/description_input_field.dart';

export 'ui/widgets/layuots/via_shipment_dashboard_layout_large_tile.dart';
export 'ui/widgets/layuots/via_shipment_dashboard_layout_small_tile.dart';

export 'ui/widgets/via_shipment_list_tile_trailing.dart';
export 'ui/widgets/via_shipment_list_tile_title.dart';
export 'ui/widgets/via_shipment_dashboard_tile.dart';
export 'ui/widgets/via_shipment_list.dart';
export 'ui/widgets/via_shipment_dashboard_list.dart';
export 'ui/widgets/icon_with_text.dart';
export 'ui/widgets/state_tag.dart';

export 'ui/widgets/description_widget.dart';
export 'ui/widgets/state_widget.dart';
export 'ui/widgets/invoiced_widget.dart';
export 'ui/widgets/delivery_place_widget.dart';
export 'ui/widgets/client_widget.dart';
export 'ui/widgets/package_widget.dart';
export 'ui/widgets/weight_widget.dart';
export 'ui/widgets/shipment_id_widget.dart';
export 'ui/widgets/shipment_type_widget.dart';

export 'ui/via_shipment_form_page.dart';
export 'ui/via_shipment_list_page.dart';
export 'ui/via_shipment_dashboard_page.dart';

export 'core/helpers/enums/via_shipment_type.dart';
export 'core/helpers/enums/via_shipment_state.dart';
export 'core/helpers/enums/via_shipment_delivery_place.dart';

void dependencies() {
  Get.put<IViaShipmentBusinessLogic>(ViaShipmentBusinessLogic(), permanent: true);

  Get.lazyPut<IViaCargoRepository>(() => ViaCargoRepository(), fenix: true);
  Get.lazyPut<IViaShipmentRepository>(() => ViaShipmentRepository(), fenix: true);
  Get.lazyPut<IViaShipmentService>(() => ViaShipmentService(), fenix: true);

  Get.lazyPut<ViaShipmentFormController>(() => ViaShipmentFormController(), fenix: true);
  Get.lazyPut<ViaShipmentListController>(() => ViaShipmentListController(), fenix: true);
  Get.lazyPut<ViaShipmentDashboardController>(() => ViaShipmentDashboardController(), fenix: true);
  Get.lazyPut<ViaShipmentDeleteController>(() => ViaShipmentDeleteController(), fenix: true);
  Get.lazyPut<ViaShipmentStateController>(() => ViaShipmentStateController(), fenix: true);
  Get.lazyPut<ViaShipmentInvoiceController>(() => ViaShipmentInvoiceController(), fenix: true);
  Get.lazyPut<ViaShipmentCancelInvoiceController>(() => ViaShipmentCancelInvoiceController(), fenix: true);
  Get.lazyPut<ViaShipmentChangeDeliveryPlaceController>(() => ViaShipmentChangeDeliveryPlaceController(), fenix: true);
}