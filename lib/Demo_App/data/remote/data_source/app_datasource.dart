import 'package:demo_application/Demo_App/core/api_provider.dart';

import 'package:demo_application/Demo_App/data/remote/remote_routes/app_remote_routes.dart';

import '../modals/response/product_Response_Modal.dart';

abstract class  AppDataSourCe {
  Future<List<ProductResponseModal>> getProductS();
}

class AppDataSourceImpl extends AppDataSourCe {
  final ApiProvider apiProvider;

  AppDataSourceImpl(this.apiProvider);
    @override
  Future<List<ProductResponseModal>> getProductS() async {
    final response = await apiProvider.get(AppRemoteRoutes.products);

    final List<ProductResponseModal> products = [];

    for (final productJson in response) {
      products.add(ProductResponseModal.fromJson(productJson));
    }

    return products;
  }
}
