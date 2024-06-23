import '../../company/core/interfaces/i_permissions_structure.dart';
import '../../company/core/model/permission_model.dart';

class AccountingAccountPermissions implements IPermissionsStructure {
  @override
  String get id => 'accounting_account';

  @override
  String get name => 'Cuentas Contables';

  final viewKey = 'accounting_account.view';
  final createKey = 'accounting_account.create';
  final updateKey = 'accounting_account.update';
  final deleteKey = 'accounting_account.delete';

  @override
  List<PermissionModel> get permissions => [
        PermissionModel(id: viewKey, name: 'Ver'),
        PermissionModel(id: createKey, name: 'Crear'),
        PermissionModel(id: updateKey, name: 'Actualizar'),
        PermissionModel(id: deleteKey, name: 'Eliminar'),
      ];
}
