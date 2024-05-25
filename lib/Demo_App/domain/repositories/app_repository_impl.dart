import 'package:demo_application/Demo_App/data/remote/data_source/app_datasource.dart';
import 'package:demo_application/Demo_App/data/repository/app_repository.dart';

import '../../data/remote/modals/response/product_Response_Modal.dart';

class AppRepositoryImPl extends AppRepoSitory {
  final AppDataSourCe appDataSourCe;

  AppRepositoryImPl(this.appDataSourCe);

  @override
  Future<List<ProductResponseModal>> getProductS() {
    return appDataSourCe.getProductS();
  }
}
