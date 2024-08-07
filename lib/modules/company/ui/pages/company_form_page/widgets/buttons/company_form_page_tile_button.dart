import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../app/ui/ui.dart';
import '../../../../../setup/interfaces/i_company_service.dart';
import '../../../../../setup/module.dart';
import '../../../../ui.dart';

class CompanyFormPageTileButton extends StatelessWidget {
  const CompanyFormPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loggedCompany = Get.find<ICompanyService>().currentCompany$;

    late final CompanyModule module = Get.find();

    return ProtectedWidget(
      key: key ?? const Key('CompanyFormPageTileButton'),
      module: module,
      permission: CompanyKeys.update.id,
      child: ListTile(
        leading: const Icon(Icons.business),
        title: Text(loggedCompany?.name ?? ''),
        onTap: () => CompanyFormPage.navigate(argument: loggedCompany?.uid ?? '', canPop: true),
      ),
    );
  }
}
